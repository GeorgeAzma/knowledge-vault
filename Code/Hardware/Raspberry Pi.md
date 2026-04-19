### My Setup
- [[Pi-Hole]] `curl -sSL https://install.pi-hole.net | sh`
- [[VPN#Tailscale|Tailscale]] `curl -fsSL https://tailscale.com/install.sh | sh && sudo tailscale set --operator pi && tailscale up`
- [[Ollama]] `curl -fsSL https://ollama.com/install.sh | sh && OLLAMA_HOST=0.0.0.0:11434 ollama serve`
- **LMStudio** `curl -fsSL https://lmstudio.ai/install.sh | sh`
##### OpenWebUI
``` bash
mkdir -p ~/code/owui
cd ~/code/owui
python3 -m venv .venv
source .venv/bin/activate
pip install open-webui
```
##### [[TMUX]]
``` bash
# tmux new -s ai

# tmux new-window -n ollama
OLLAMA_HOST=0.0.0.0:11434 ollama serve

# tmux new-window -n owui
open-webui serve --host 0.0.0.0 --port 8080

# tmux new-window -n lmstudio
lms get https://huggingface.co/HauhauCS/Qwen3.5-2B-Uncensored-HauhauCS-Aggressive
lms server start
lms login
lms link enable
```