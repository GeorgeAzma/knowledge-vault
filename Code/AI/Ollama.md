``` bash
curl -fsSL https://ollama.com/install.sh | sh

OLLAMA_HOST=0.0.0.0:11434 ollama serve # OLLAMA_CONTEXT_LENGTH=32768 OLLAMA_FLASH_ATTENTION=1

curl http://localhost:11434/api/generate -d '{
  "model": "qwen3.5",
  "prompt": "Why is the sky blue?",
  "options": {
    "num_ctx": 32768
  }
}'

systemctl edit ollama.service
# [Service] 
# Environment="OLLAMA_HOST=0.0.0.0:11434"
systemctl daemon-reload
systemctl restart ollama

cloudflared tunnel --url http://localhost:11434 --http-host-header="localhost:11434"
```
### [[Systemd]] Service File
`/etc/systemd/system/ollama.service`
``` toml
[Unit]
Description=Ollama Service
After=network-online.target

[Service]
ExecStart=/usr/bin/ollama serve
User=ollama
Group=ollama
Restart=always
RestartSec=3
Environment="PATH=$PATH"

[Install]
WantedBy=multi-user.target
```
### [[Nginx]]
``` nginx
server {
    listen 80;
    server_name example.com;  # Replace with your domain or IP
    location / {
        proxy_pass http://localhost:11434;
        proxy_set_header Host localhost:11434;
    }
}
```