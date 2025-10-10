``` python
import torch
from torchvision import transforms
from PIL import Image
import torch.nn as nn
import matplotlib.pyplot as plt

n_splats = 256
device = torch.device("cuda")
image_size = torch.tensor([128, 128], device=device)
epochs = 2048

with torch.no_grad():
    xy = torch.randn(n_splats, 2, device=device)
    rgb = torch.randn(n_splats, 3, device=device)
    wh = torch.randn(n_splats, 2, device=device) * 0.5 - 1.0  # bias toward smaller
    theta = torch.randn(n_splats, 1, device=device) * 2 * torch.pi
    splats_init = torch.cat([rgb, xy, wh, theta], dim=1)
    
splats = nn.Parameter(splats_init.to(device))

transform = transforms.Compose([
    transforms.Resize((image_size[0], image_size[1])),
    transforms.ToTensor(),
])

image = Image.open('img2.webp')
image_tensor = transform(image)

def render_splats(splats: torch.Tensor, image_size: torch.Tensor):
    y, x = torch.meshgrid(torch.linspace(0, 1, image_size[0], device=splats.device),
                          torch.linspace(0, 1, image_size[1], device=splats.device), indexing='ij')
    uv = torch.stack([x, y], dim=-1)
    
    rgb, xy, wh, theta = splats[:, :3], splats[:, 3:5], splats[:, 5:7], splats[:, 7]
    wh = image_size ** (wh.sigmoid() - 1)
    xy = xy.sigmoid()
    cos, sin = theta.cos()[None, None, :], theta.sin()[None, None, :]

    duv = uv[:, :, None] - xy[None, None, ...]
    dx, dy = duv[..., 0], duv[..., 1]
    rot_duv = torch.stack([cos * dx + sin * dy, -sin * dx + cos * dy], dim=-1)
    xy = rot_duv / wh[None, None, :, :]
    
    alpha = (-(xy ** 2).sum(dim=-1)).exp()
    alphas_shifted = torch.cat([torch.zeros_like(alpha[:, :, :1]), alpha[:, :, :-1]], dim=2)
    transmittance = torch.cumprod(1.0 - alphas_shifted, dim=2)
    weights = alpha * transmittance

    return torch.einsum('hwn,nc->chw', weights, rgb).sigmoid()

target = transform(image).to(device)

import lpips
import time

plt.ion()
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 5))
ax1.imshow(target.permute(1, 2, 0).detach().cpu().numpy())
ax1.axis('off')
rendered_im = ax2.imshow(torch.zeros_like(target).permute(1, 2, 0).detach().cpu().numpy())
ax2.axis('off')

plt.tight_layout()
plt.show()

optimizer = torch.optim.AdamW([splats], lr=0.03)
scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer, T_0=epochs // 8)
scaler = torch.amp.GradScaler()
vgg_loss = lpips.LPIPS(net='vgg').to(device)
for epoch in range(epochs):
    start_time = time.time()
    optimizer.zero_grad()
    
    with torch.amp.autocast(device_type=device.type, dtype=torch.bfloat16):
        rendered = render_splats(splats, image_size)
        
        l1_loss = torch.nn.functional.l1_loss(rendered, target)
        mse_loss = torch.nn.functional.mse_loss(rendered, target)
        lpips_loss = vgg_loss(rendered, target)
        loss = l1_loss + mse_loss ** 0.5 + lpips_loss * 0.1
    
    scaler.scale(loss).backward()
    scaler.unscale_(optimizer)
    torch.nn.utils.clip_grad_norm_(splats, max_norm=1.0)
    scaler.step(optimizer)
    scaler.update()
    scheduler.step()

    with torch.no_grad():
        rendered_im.set_array(torch.clamp(rendered.permute(1, 2, 0).detach().float(), 0, 1).cpu().numpy())
        plt.pause(0.01)
    s = f"\x1b[34mEpoch {epoch}\x1b[0m   "
    s += f"\x1b[31mLoss {loss.item():.5f}\x1b[0m   "
    s += f"\x1b[90m{time.time() - start_time:.2f}s\x1b[0m   "
    s += f"\x1b[32mLr {optimizer.param_groups[0]['lr']:.4f}\x1b[0m   "
    print(s)
```
