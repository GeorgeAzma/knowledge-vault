### Generated Sample
trained on `lord of the rings` and `atomic habits` with `prompt = ' '`
```
dataset_chars = 2M, temperature=1, max_gen_toks=512, batch_size=64
vocab_len=256, d_model=256, seq_len=32, nhead=4, nlayer=1, d_ff=1024
lr=0.001, betas=(0.9,0.99), dropout=0, label_smoothing=0
train_loss=1.38, test_loss=1.39, time=240ms 

ended be explore,
and yet north it chill was march.
'And you look with me; and
meadow shall get a stiff burds rest-bottom. It was perhaps stay had and of the edge more the
said. 'You would keep bringing down arose you know I
know and must, and guards well our break way; and their
what. The pointing about that countain were,
him of the Bridge
family though place from the Lordry,' he said
Hobbits is only a cool and
with shadows were our head.'
But back from bell as a grow was on eaching light had o
```
### GPT Code `some bugs`
``` python
import time
import os
import torch
import torch.nn as nn
import torch.nn.functional as F
from tokenizer import Tokenizer

device = "cuda" if torch.cuda.is_available() else "cpu"

class FeedForward(nn.Module):
    def __init__(self, d_model, d_ff, dropout):
        super().__init__()
        self.net = nn.Sequential(
            nn.Linear(d_model, d_ff),
            nn.GELU(),
            nn.Linear(d_ff, d_model),
            nn.Dropout(dropout),
        )

    def forward(self, x):
        return self.net(x)


class MultiheadAttention(nn.Module):
    def __init__(self, d_model, nhead, seq_len, dropout):
        super().__init__()
        assert d_model % nhead == 0, "d_model must be divisible by nhead"
        self.nhead = nhead
        self.d_head = d_model // nhead

        # Combine projections for Q, K, V into a single linear layer for efficiency
        self.qkv_proj = nn.Linear(d_model, 3 * d_model, bias=False)
        self.out_proj = nn.Linear(d_model, d_model)
        self.dropout = nn.Dropout(dropout)

        # Mask for causal attention
        self.register_buffer("tril", torch.tril(torch.ones(seq_len, seq_len)))

    def forward(self, x: torch.Tensor):
        B, T, C = x.shape

        # Compute Q, K, V projections in one go
        qkv = self.qkv_proj(x)  # Shape: (B, T, 3 * d_model)
        q, k, v = torch.chunk(qkv, 3, dim=-1)  # Each: (B, T, d_model)

        # Reshape to split into multiple heads
        q = q.view(B, T, self.nhead, self.d_head).transpose(1, 2)  # (B, nhead, T, d_head)
        k = k.view(B, T, self.nhead, self.d_head).transpose(1, 2)  # (B, nhead, T, d_head)
        v = v.view(B, T, self.nhead, self.d_head).transpose(1, 2)  # (B, nhead, T, d_head)

        # Scaled dot-product attention
        attn_weights = torch.matmul(q, k.transpose(-2, -1)) / (self.d_head ** 0.5)  # (B, nhead, T, T)

        # Apply causal mask
        mask = self.tril[:T, :T].unsqueeze(0).unsqueeze(1)  # (1, 1, T, T)
        attn_weights = attn_weights.masked_fill(mask == 0, float("-inf"))
        attn_weights = attn_weights.softmax(dim=-1)
        attn_weights = self.dropout(attn_weights)

        # Weighted sum of values
        out = torch.matmul(attn_weights, v)  # (B, nhead, T, d_head)

        # Merge heads and project back to the model dimension
        out = out.transpose(1, 2).contiguous().view(B, T, C)  # (B, T, d_model)
        out = self.out_proj(out)  # (B, T, d_model)
        out = self.dropout(out)
        return out
    
class TransformerBlock(nn.Module):
    def __init__(self, d_model, nhead, seq_len, d_ff, dropout):
        super().__init__()
        self.attention = MultiheadAttention(d_model, nhead, seq_len, dropout)
        if d_ff > 0:
            self.feedforward = FeedForward(d_model, d_ff, dropout)

        self.norm1 = nn.LayerNorm(d_model)
        self.norm2 = nn.LayerNorm(d_model)

    def forward(self, x):
        x = x + self.attention(self.norm1(x))
        if hasattr(self, "feedforward"):
            x = x + self.feedforward(self.norm2(x))
        return x

class GPTModel(nn.Module):
    def __init__(self, vocab_len, d_model, nhead, seq_len, d_ff, nlayer, lr, betas, dropout):
        super().__init__()
        self.context_len = seq_len
        self.token_embedding = nn.Embedding(vocab_len, d_model)
        self.position_embedding = nn.Embedding(seq_len, d_model)
        self.blocks = nn.Sequential(*[TransformerBlock(d_model, nhead, seq_len, d_ff, dropout) for _ in range(nlayer)])
        self.norm = nn.LayerNorm(d_model)
        self.linear = nn.Linear(d_model, vocab_len)
        self.optimizer = torch.optim.Adam(
            self.parameters(), lr, betas
        )

    def forward(self, idx, targets=None, label_smoothing=0.0):
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
            loss = F.cross_entropy(logits, targets, label_smoothing=label_smoothing)

        return logits, loss

    def generate(self, toks, max_new_tokens, context_len, temperature=1.0):
        for _ in range(max_new_tokens):
            idx_crop = toks[:, -context_len:]
            logits = self(idx_crop)[0]
            logits = logits[:, -1, :]
            probs = F.softmax(logits / temperature, -1)
            idx_next = torch.multinomial(probs, num_samples=1)
            toks = torch.cat((toks, idx_next), 1)
        return toks

    def train_step(self, x, y, label_smoothing=0.0):
        loss = self.forward(x, y, label_smoothing)[1]
        self.optimizer.zero_grad(set_to_none=None)
        loss.backward()
        self.optimizer.step()
        return loss

class GPT:
    # creates vocabulary from text_file unless it is None
    def __init__(self, text_file:str=None, vocab_len=256, seq_len=32, d_model=256, nhead=4, nlayer=2, d_ff=512, lr=0.001, betas=(0.9, 0.99), dropout=0.0):
        self.vocab_len = vocab_len
        self.seq_len = seq_len
        self.d_model = d_model
        self.nhead = nhead
        self.nlayer = nlayer
        self.d_ff = d_ff
        self.lr = lr
        self.betas = betas
        self.dropout = dropout
        if text_file is not None and os.path.isfile(f"{text_file}.txt"):
            with open(f"{text_file}.txt", "rb") as file:
                self.text = file.read().decode("utf8")
                self.tokenizer = Tokenizer(self.text, vocab_len)
                self.gpt = GPTModel(max(vocab_len, 256), d_model, nhead, seq_len, d_ff, nlayer, lr, betas, dropout).to(device)

    # loads gpt weights and vocabulary
    def load(self, file: str):
        self.gpt.load_state_dict(torch.load(f"{file}.pt", weights_only=True))
        self.tokenizer.load(f"{file}.vocab")
        self.gpt = GPTModel(self.tokenizer.vocab_size(), self.d_model, self.nhead, self.seq_len, self.d_ff, self.nlayer, self.lr, self.betas, self.dropout).to(device)

    # saves gpt weights and vocabulary
    def save(self, file: str):
        self.tokenizer.save(f"{file}.vocab")
        torch.save(self.gpt.state_dict(), f"{file}.pt")
        
    # trains and every print_interval epochs it prints train/test loss and other data
    def train(self, epochs: int=2048, print_interval=32, label_smoothing=0.0):
        scheduler = torch.optim.lr_scheduler.CosineAnnealingLR(
            self.gpt.optimizer, epochs
        )
        data = self.tokenizer.encode(self.text)
        split = int(len(data) * 0.9)
        train_data = data[:split]
        test_data = data[split:]

        def get_batch(context_len, batch_len, split="train"):
            data = train_data if split == "train" else test_data
            ix = torch.randint(len(data) - context_len - 1, (batch_len,))
            x = torch.stack([data[i : i + context_len] for i in ix])
            y = torch.stack([data[i + 1 : i + context_len + 1] for i in ix])
            return x.to(device), y.to(device)

        self.gpt.train()
        batch_size = 64
        start = time.perf_counter()
        for epoch in range(epochs):
            x, y = get_batch(self.seq_len, batch_size, "train")
            loss = self.gpt.train_step(x, y, label_smoothing)
            try: # reduce on plateau
                scheduler.step(metrics=loss)
            except: # others
                scheduler.step()
            if print_interval >= 0 and epoch % print_interval == print_interval - 1 or epoch == epochs - 1:
                x, y = get_batch(self.seq_len, batch_size, "test")
                test_loss = self.gpt.forward(x, y, label_smoothing)[1].item()
                curr_lr = self.gpt.optimizer.param_groups[0]['lr']
                print(
                    f"{epoch:4}: Train: {loss:.3f} | Test: {test_loss:.3f} | Lr: {curr_lr:.2e} | Time: {round((time.perf_counter() - start) * 1000)}ms"
                )
                start = time.perf_counter()

    # generates new text using prompt as base
    def gen(self, max_gen_toks=128, prompt=' ', temperature=1.0):
        self.gpt.eval()
        return self.tokenizer.decode(
            self.gpt.generate(
                self.tokenizer.encode(prompt).unsqueeze(0).to(device),
                max_gen_toks,
                self.seq_len,
                temperature
            )[0]
        )


gpt = GPT("data_small", d_model=256, seq_len=32, nhead=4, nlayer=1, d_ff=1024, lr=0.001, betas=(0.9, 0.99))
gpt.train(16384)
print(gpt.gen(512))
```
### Tokenizer
``` python
import torch
import os
from collections import defaultdict

class Tokenizer:
    def __init__(
        self, text: str = "", max_tokens: int = 0, include_all_characters=True, file=None
    ):
        if file is not None and os.path.isfile(file):
            self.load(file)
            return
        if text is None or len(text) == 0:
            return
        words = text.split(" ")
        words = [word.encode("utf-8") for word in words]
        vocab = defaultdict(int)
        if include_all_characters:
            for c in range(0, 256):
                vocab[bytes([c])] = 1
        if len(vocab) < max_tokens:
            for word in words:
                vocab[word] += 1
            words = list(vocab.items())

            if not include_all_characters:
                for word, freq in words:
                    for c in word:
                        vocab[bytes([c])] += freq
            for word, freq in words:
                max_word_len = min(len(word), 16)
                for length in range(2, min(len(word), max_word_len) + 1):
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
        self.set_vocab(vocab_tokens)


    def set_vocab(self, vocab: list[bytes]):
        self.vocab = vocab
        self.vocab_map = {token: i for i, token in enumerate(vocab)}

    def save(self, file: str):
        with open(file, "wb") as file:
            for tok in self.vocab:
                file.write(len(tok).to_bytes(1) + tok)
    
    def load(self, file: str):
        vocab = []
        with open(file, "rb") as file:
            while size := file.read(1):
                size = int.from_bytes(size)
                vocab.append(file.read(size))
        self.set_vocab(vocab)

    def to_string(self) -> list[str]:
        return ["".join([chr(c) for c in token]) for token in self.vocab]

    def vocab_size(self):
        return len(self.vocab)

    def id_to_tok(self, key):
        return self.vocab[key]
    
    def tok_to_id(self, tok):
        return self.vocab_map[tok]

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
```
