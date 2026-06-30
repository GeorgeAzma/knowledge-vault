### My Setup
- [[Pi-Hole]] `curl -sSL https://install.pi-hole.net | sh`
- [[VPN#Tailscale|Tailscale]] `curl -fsSL https://tailscale.com/install.sh | sh && sudo tailscale set --operator pi && tailscale up`
- [[Ollama]] `curl -fsSL https://ollama.com/install.sh | sh && OLLAMA_HOST=0.0.0.0:11434 ollama serve`
##### LMStudio
``` bash
curl -fsSL https://lmstudio.ai/install.sh | sh
lms get https://huggingface.co/HauhauCS/Qwen3.5-2B-Uncensored-HauhauCS-Aggressive
lms login
lms link enable
```
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

# 1. tmux new-window -n ollama
OLLAMA_HOST=0.0.0.0:11434 ollama serve

# 2. tmux new-window -n owui
open-webui serve --host 0.0.0.0 --port 8080

# 3. tmux new-window -n lmstudio
lms server start

# tmux new -s services

# 1. btu
cd ~/code/btu-classroom-dashboard
./run.sh --headless
```
### Startup
`~/code/scripts/start-services.sh`
``` bash
#!/bin/bash
# ─────────────────────────────────────────────
#  Startup script — AI & Services tmux sessions
# ─────────────────────────────────────────────

SESSION_AI="ai"
SESSION_SVC="services"

# ── Helper: kill existing sessions to avoid duplicates ──
tmux has-session -t "$SESSION_AI"  2>/dev/null && tmux kill-session -t "$SESSION_AI"
tmux has-session -t "$SESSION_SVC" 2>/dev/null && tmux kill-session -t "$SESSION_SVC"

# ════════════════════════════════════════════
#  Session: ai
# ════════════════════════════════════════════
tmux new-session -d -s "$SESSION_AI" -n "ollama"

# Window 1 — ollama
tmux send-keys -t "$SESSION_AI:ollama" \
  "OLLAMA_HOST=0.0.0.0:11434 ollama serve" Enter

# Window 2 — open-webui
tmux new-window -t "$SESSION_AI" -n "owui"
tmux send-keys -t "$SESSION_AI:owui" \
  "cd ~/code/owui/.venv/bin && ./open-webui serve --host 0.0.0.0 --port 8080" Enter

# Window 3 — LM Studio
tmux new-window -t "$SESSION_AI" -n "lmstudio"
tmux send-keys -t "$SESSION_AI:lmstudio" \
  "lms server start" Enter

# Focus back to first window
tmux select-window -t "$SESSION_AI:ollama"

# ════════════════════════════════════════════
#  Session: services
# ════════════════════════════════════════════
tmux new-session -d -s "$SESSION_SVC" -n "truck-bot"

# Window 1 — Truck Bot
tmux send-keys -t "$SESSION_SVC:truck-bot" \
  "cd ~/code/truck-bot && ./run.sh" Enter
```
`/etc/systemd/system/my-services.service`
``` toml
[Unit]
Description=Start AI & Services tmux sessions
After=network-online.target
Wants=network-online.target

[Service]
Type=forking
User=pi
Environment="HOME=/home/pi"
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ExecStart=/home/pi/code/scripts/start-services.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```
### log2ram
stores log files into ram to avoid constant small writes to SD card which degrades it
``` bash
git clone https://github.com/azlux/log2ram.git
cd log2ram
chmod +x install.sh
sudo ./install.sh
```
