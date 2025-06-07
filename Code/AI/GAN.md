Generative Adversarial Network
### Generator
Learns to generate an image by having random noise as an input, 
upscaling it using [[PyTorch Convolution|ConvTranspose2D]] layers, which also applies
weights and biases to make it look more like image it's trying to generate
### Discriminator
Receives input from either fake generator generated image or real image
It tries to guess if the image is real or not, and gets better at it during training
### Training
- Generator receives random input (latent space)
- Generator processes and generates image from that random input
- Discriminator receives generated or real image and guesses if it's real
- If discriminator is wrong loss increases and it decreases for 
  generator since it managed to trick discriminator
- Discriminator becomes better at guessing and generator becomes better at generating until discriminator can't distinguish real from fake
> [!note]
> Discriminator uses [[PyTorch Convolution|Conv2D]] for detecting features in the image to help differentiate real images from fake ones
### Code
- Linear GAN
```Python
import torch
import torch.nn as nn


class LinGenerator(nn.Module):
    def __init__(self, latent, hidden, img_size):
        super().__init__()
        self.gen = nn.Sequential(
            nn.Linear(latent, hidden),
            nn.LeakyReLU(0.2, True),
            nn.Linear(hidden, hidden * 2),
            nn.BatchNorm1d(hidden * 2),
            nn.LeakyReLU(0.2, True),
            nn.Linear(hidden * 2, hidden * 4),
            nn.BatchNorm1d(hidden * 4),
            nn.LeakyReLU(0.2, True),
            nn.Linear(hidden * 4, img_size),
            nn.Tanh(),
        )
        self.apply(self.init_weights)

    def forward(self, x):
        if x.dim() > 1:
            x = x.view(x.size(0), -1)
        return self.gen(x)

    def init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.normal_(m.weight, mean=0.0, std=0.03)


class LinDiscriminator(nn.Module):
    def __init__(self, hidden, img_size):
        super().__init__()
        self.dis = nn.Sequential(
            nn.Linear(img_size, hidden * 2),
            nn.LeakyReLU(0.2, True),
            nn.Linear(hidden * 2, hidden),
            nn.BatchNorm1d(hidden),
            nn.LeakyReLU(0.2, True),
            nn.Linear(hidden, 1),
            nn.Sigmoid(),
        )
        self.apply(self.init_weights)

    def forward(self, x):
        x = x.view(x.size(0), -1)
        return self.dis(x)

    def init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.normal_(m.weight, mean=0.0, std=0.03)


class LinGAN(nn.Module):
    def __init__(self, latent, hidden_gen, hidden_dis, img_size, lr=0.0002):
        super().__init__()
        self.latent = latent
        self.gen = LinGenerator(latent, hidden_gen, img_size)
        self.dis = LinDiscriminator(hidden_dis, img_size)
        self.loss = nn.BCELoss()
        self.opt_gen = torch.optim.Adam(self.gen.parameters(), lr, betas=(0.5, 0.999))
        self.opt_dis = torch.optim.Adam(self.dis.parameters(), lr, betas=(0.5, 0.999))

    def forward(self, x=None):
        return self.gen(x)

    def backward(self, y):
        batch_size = y.size(0)

        real = torch.ones(batch_size, device=y.device)
        fake = torch.zeros(batch_size, device=y.device)

        self.dis.zero_grad()
        discriminated_reals = self.dis(y).view(-1)
        loss_real = self.loss(discriminated_reals, real)
        x = torch.randn(batch_size, self.latent, device=y.device)
        generated = self.gen(x)
        discriminated_fakes = self.dis(generated.detach()).view(-1)
        loss_fake = self.loss(discriminated_fakes, fake)
        loss_dis = loss_real + loss_fake
        loss_dis.backward()
        # nn.utils.clip_grad_norm_(self.dis.parameters(), max_norm=1.0)
        self.opt_dis.step()

        self.gen.zero_grad()
        discriminated_fakes = self.dis(generated).view(-1)
        loss_gen = self.loss(discriminated_fakes, real)
        loss_gen.backward()
        # nn.utils.clip_grad_norm_(self.gen.parameters(), max_norm=1.0)
        self.opt_gen.step()

        return loss_gen, loss_dis
```
- DCGAN (GAN using convolutional layers only)
```Python
import torch
import torch.nn as nn


class DCGenerator(nn.Module):
    def __init__(self, latent, hidden, channels=3):
        super().__init__()
        self.latent = latent
        self.hidden = hidden
        self.channels = channels
        self.gen = nn.Sequential(
            nn.ConvTranspose2d(latent, hidden * 8, 4, bias=False),
            nn.LeakyReLU(0.2, True),
            self._block(8, 4),
            self._block(4, 2),
            self._block(2, 1),
            nn.ConvTranspose2d(hidden, channels, 4, 2, 1, bias=False),
            nn.Tanh(),
        )
        self.apply(self.init_weights)

    def _block(self, prev_hidden_multiplier=1, hidden_multiplier=1):
        return nn.Sequential(
            nn.ConvTranspose2d(
                self.hidden * prev_hidden_multiplier,
                self.hidden * hidden_multiplier,
                kernel_size=4,
                stride=2,
                padding=1,
                bias=False,
            ),
            nn.LazyBatchNorm2d(),
            nn.LeakyReLU(0.2, True),
        )

    def forward(self, x):
        if x.dim() <= 2:
            x = x.view(x.size(0), x.size(1), 1, 1)
        return self.gen(x)

    def init_weights(self, m):
        if isinstance(m, nn.ConvTranspose2d):
            nn.init.normal_(m.weight, mean=0.0, std=0.02)


class DCDiscriminator(nn.Module):
    def __init__(self, hidden, channels=3):
        super().__init__()
        self.hidden = hidden
        self.dis = nn.Sequential(
            nn.Conv2d(channels, hidden, 4, 2, 1, bias=False, padding_mode="replicate"),
            nn.Dropout2d(0.3),
            nn.BatchNorm2d(hidden),
            nn.LeakyReLU(0.2, True),
            self._block(1, 2),
            self._block(2, 4),
            self._block(4, 8),
            nn.Conv2d(hidden * 8, 1, 4, bias=False, padding_mode="replicate"),
            nn.Sigmoid(),
        )
        self.apply(self.init_weights)

    def _block(self, prev_hidden_multiplier=1, hidden_multiplier=1):
        return nn.Sequential(
            nn.Conv2d(
                self.hidden * prev_hidden_multiplier,
                self.hidden * hidden_multiplier,
                4,
                2,
                1,
                bias=False,
                padding_mode="replicate",
            ),
            nn.BatchNorm2d(self.hidden * hidden_multiplier),
            nn.LeakyReLU(0.2, True),
        )

    def forward(self, x=None):
        return self.dis(x)

    def init_weights(self, m):
        if isinstance(m, nn.Conv2d):
            nn.init.normal_(m.weight, mean=0.0, std=0.02)


class DCGAN(nn.Module):
    def __init__(self, latent, hidden_gen, hidden_dis, lr=0.0002, channels=3):
        super().__init__()
        self.latent = latent
        self.gen = DCGenerator(latent, hidden_gen, channels)
        self.dis = DCDiscriminator(hidden_dis, channels)
        self.loss = nn.BCELoss()
        self.opt_gen = torch.optim.AdamW(self.gen.parameters(), lr, (0.5, 0.999))
        self.opt_dis = torch.optim.AdamW(self.dis.parameters(), lr, (0.5, 0.999))

    def forward(self, x=None):
        return self.gen(x)

    def backward(self, y):
        if y.dim() <= 3:
            y = y.unsqueeze(1)
        batch_size = y.size(0)

        real = torch.ones(batch_size, device=y.device)
        fake = torch.zeros(batch_size, device=y.device)

        discriminated_reals = self.dis(y).view(-1)
        loss_real = self.loss(discriminated_reals, real)
        x = torch.randn(batch_size, self.latent, device=y.device)
        generated = self.gen(x)
        discriminated_fakes = self.dis(generated.detach()).view(-1)
        loss_fake = self.loss(discriminated_fakes, fake)
        loss_dis = loss_real + loss_fake
        self.dis.zero_grad()
        loss_dis.backward()
        # nn.utils.clip_grad_norm_(self.dis.parameters(), max_norm=1.0)
        self.opt_dis.step()

        discriminated_fakes = self.dis(generated).view(-1)
        loss_gen = self.loss(discriminated_fakes, real)
        self.gen.zero_grad()
        loss_gen.backward()
        # nn.utils.clip_grad_norm_(self.gen.parameters(), max_norm=1.0)
        self.opt_gen.step()

        return loss_gen, loss_dis
```
- ProGAN
```Python
```
![[ProGAN.webp]]
