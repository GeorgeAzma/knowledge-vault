- `btop` good htop alternative
- `tmux` [[TMUX]]
- [[Linux Network]]
- [[Arch Linux]]
- [[Pi-Hole]]
- [[Package Manager]]
### File Manager `yazi
``` bash
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
cargo install yazi-build
```
### Font
``` bash
sudo mkdir -p /usr/local/share/fonts/JetBrainsMono
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xf JetBrainsMono.tar.xz
sudo fc-cache -fv
fc-list | grep "JetBrainsMono"

# powershell
& ([scriptblock]::Create((iwr 'https://to.loredo.me/Install-NerdFont.ps1')))
```
### AI
- [[Ollama]]
- [[ComfyUI]]
``` bash
curl -fsSL https://lmstudio.ai/install.sh | bash

lms server start --bind 0.0.0.0 # port: 1234, OAI compatible
```