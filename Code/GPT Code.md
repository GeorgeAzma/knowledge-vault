```Python
from collections import defaultdict
import torch
import torch.nn as nn
import torch.nn.functional as F

batch_size = 64
context_len = 32
vocab_len = 2048

n_layers = 1
n_heads = 1
n_embed = 64

learning_rate = 0.01
betas = (0.9, 0.999)
weight_decay = 0.0
dropout = 0.0
epsilon = 1e-6

train_steps = 1024
eval_iters = 4
eval_interval = 32

device = "cuda" if torch.cuda.is_available() else "cpu"


class Tokenizer:
    def __init__(
        self, text: str = "", max_tokens: int = 0, include_all_characters=True
    ):
        if len(text) == 0:
            return
        words = text.split(" ")
        words = [word.encode("utf-8") for word in words]
        vocab = defaultdict(int)
        if include_all_characters:
            for c in range(0, 256):
                vocab[bytes([c])] = 1
        for word in words:
            vocab[word] += 1
        words = list(vocab.items())

        for word, freq in words:
            for c in word:
                vocab[bytes([c])] += freq
        for word, freq in words:
            for length in range(2, len(word) + 1):
                for start in range(0, len(word) - length + 1):
                    substr = word[start : start + length]
                    vocab[substr] += freq

        space_count = len(words) - 1
        vocab[b" "] = space_count

        vocab = list(vocab.items())
        vocab.sort(key=lambda k: k[1] + (len(k[0]) == 1) * 1_000_000_000, reverse=True)
        vocab_tokens = [token for token, _ in vocab]
        mandatory_characters = len(list(filter(lambda x: len(x) == 1, vocab_tokens)))
        max_tokens = max(max_tokens, mandatory_characters)
        if len(vocab_tokens) > max_tokens:
            vocab_tokens = vocab_tokens[:max_tokens]
        self.init_with(vocab_tokens)

    def init_with(self, vocab: list[bytes]):
        self.vocab = vocab
        self.vocab_map = {token: i for i, token in enumerate(vocab)}

    def to_string(self) -> list[str]:
        return ["".join([chr(c) for c in token]) for token in self.vocab]

    def __len__(self):
        return len(self.vocab)

    def __getitem__(self, key):
        return self.vocab[key]

    def encode(self, text: str) -> torch.Tensor:
        words = text.split(" ")
        words = [word.encode("utf-8") for word in words]
        tokens = []
        for i, word in enumerate(words):
            acc = b""
            for c in word:
                if not (acc + bytes([c]) in self.vocab_map):
                    tokens.append(self.vocab_map[acc])
                    acc = b""
                acc += bytes([c])
            if len(acc) > 0:
                tokens.append(self.vocab_map[acc])
            if i < len(words) - 1:
                tokens.append(self.vocab_map[b" "])
        return torch.tensor(tokens, dtype=torch.long)

    def decode(self, tokens: list[int]) -> str:
        text = ""
        vocab_str = self.to_string()
        for token in tokens:
            text += vocab_str[token]
        return text


class Head(nn.Module):
    def __init__(self, head_size, n_embed, context_len):
        super().__init__()
        self.key = nn.Linear(n_embed, head_size, bias=False)
        self.query = nn.Linear(n_embed, head_size, bias=False)
        # NOTE: this can have different head_size
        self.value = nn.Linear(n_embed, head_size, bias=False)
        self.register_buffer("tril", torch.tril(torch.ones(context_len, context_len)))
        self.dropout = nn.Dropout(dropout)

    def forward(self, x):
        _, T, C = x.shape
        k = self.key(x)
        q = self.query(x)

        w = q @ k.transpose(-2, -1) * C**-0.5
        w = w.masked_fill(self.tril[:T, :T] == 0, float("-inf"))
        w = w.softmax(-1)
        w = self.dropout(w)

        v = self.value(x)
        out = w @ v
        return out


class MultiheadAttention(nn.Module):
    def __init__(self, n_heads, head_size, context_len):
        super().__init__()
        n_embed = n_heads * head_size
        self.heads = nn.ModuleList(
            [Head(head_size, n_embed, context_len) for _ in range(n_heads)]
        )
        self.proj = nn.Linear(n_embed, n_embed)
        self.dropout = nn.Dropout(dropout)

    def forward(self, x):
        out = torch.cat([h(x) for h in self.heads], -1)
        out = self.dropout(self.proj(out))
        return out


class FeedForward(nn.Module):
    def __init__(self, n_embed):
        super().__init__()
        d_ff = 4 * n_embed
        self.net = nn.Sequential(
            nn.Linear(n_embed, d_ff),
            nn.ReLU(),
            nn.Linear(d_ff, n_embed),
            nn.Dropout(dropout),
        )

    def forward(self, x):
        return self.net(x)


class Block(nn.Module):
    def __init__(self, n_embed, n_heads, context_len):
        super().__init__()
        head_size = n_embed // n_heads
        self.sa = MultiheadAttention(n_heads, head_size, context_len)
        self.ff = FeedForward(n_embed)
        self.norm1 = nn.LayerNorm(n_embed)
        self.norm2 = nn.LayerNorm(n_embed)

    def forward(self, x):
        x = x + self.sa(self.norm1(x))
        x = x + self.ff(self.norm2(x))
        return x


class GPTModel(nn.Module):
    def __init__(self, vocab_len, n_embed, context_len):
        super().__init__()
        self.context_len = context_len
        self.token_embedding = nn.Embedding(vocab_len, n_embed)
        # TODO: Try using encode_position()
        self.position_embedding = nn.Embedding(context_len, n_embed)
        self.blocks = nn.Sequential(
            *[Block(n_embed, n_heads, context_len) for _ in range(n_layers)]
        )
        self.norm = nn.LayerNorm(n_embed)
        self.linear = nn.Linear(n_embed, vocab_len)
        self.opt = torch.optim.AdamW(
            self.parameters(), learning_rate, betas, epsilon, weight_decay
        )

    def forward(self, idx, targets=None):
        B, T = idx.shape

        tok_emb = self.token_embedding(idx)
        pos_emb = self.position_embedding(torch.arange(T, device=device))
        x = tok_emb + pos_emb
        x = self.blocks(x)
        x = self.norm(x)
        logits = self.linear(x)
        if targets is None:
            loss = None
        else:
            B, T, C = logits.shape
            logits = logits.view(B * T, C)
            targets = targets.view(B * T)
            loss = F.cross_entropy(logits, targets)

        return logits, loss

    def generate(self, idx, max_new_tokens, context_len):
        for _ in range(max_new_tokens):
            idx_crop = idx[:, -context_len:]
            logits = self(idx_crop)[0]
            logits = logits[:, -1, :]
            probs = F.softmax(logits, -1)
            idx_next = torch.multinomial(probs, num_samples=1)
            idx = torch.cat((idx, idx_next), 1)
        return idx

    def train_step(self, x, y, batch_size):
        x, y = get_batch(self.context_len, batch_size, "train")
        loss = self(x, y)[1]
        self.opt.zero_grad(set_to_none=None)
        loss.backward()
        self.opt.step()

    @torch.no_grad()
    def estimate_loss(self, eval_iters):
        out = {}
        self.eval()
        for split in ["train", "test"]:
            losses = torch.zeros(eval_iters)
            for k in range(eval_iters):
                x, y = get_batch(self.context_len, 1, split)
                losses[k] = self(x, y)[1].item()
            out[split] = losses.mean()
        self.train()
        return out


with open("data.txt", "rb") as file:
    text = file.read().decode("utf8")

tokenizer = Tokenizer(text, vocab_len, False)
vocab_len = len(tokenizer.vocab)
data = tokenizer.encode(text)

split = int(len(data) * 0.9)
train_data = data[:split]
test_data = data[split:]


def get_batch(context_len, batch_len, split="train"):
    data = train_data if split == "train" else test_data
    ix = torch.randint(len(data) - context_len, (batch_len,))
    x = torch.stack([data[i : i + context_len] for i in ix])
    y = torch.stack([data[i + 1 : i + context_len + 1] for i in ix])
    return x.to(device), y.to(device)


model = GPTModel(vocab_len, n_embed, context_len).to(device)


def generate_text(max_new_tokens=128, start_text=" "):
    return tokenizer.decode(
        model.generate(
            tokenizer.encode(start_text).unsqueeze(0).to(device),
            max_new_tokens,
            context_len,
        )[0],
    )


x, y = get_batch(context_len, batch_size)

for iter in range(train_steps):
    if iter % eval_interval == 0 or iter == train_steps - 1:
        losses = model.estimate_loss(eval_iters)
        sample = (
            generate_text(16)
            .replace("\r", "<r>")
            .replace("\n", "<n>")
            .replace("\t", "<t>")
        )
        print(
            "{:4}: Train: {:.3f} | Test: {:.3f} | Sample: {}".format(
                iter,
                losses["train"],
                losses["test"],
                sample,
            )
        )
    model.train_step(x, y, batch_size)

print(generate_text(512))

```
