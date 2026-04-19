---
aliases:
- Systemctl
- Linux Startup Services
---
for setting up linux startup services/tasks
### Example
``` bash
sudo nano /etc/systemd/system/llm-server.service
```

``` toml
[Unit]
Description=LLM Server Startup Service
After=network.target

[Service]
User=lumi
ExecStart=/home/lumi/.lmstudio/llmster/0.0.10-1/llmster daemon up
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
```

``` bash
sudo systemctl daemon-reload
sudo systemctl enable llm-server
sudo systemctl start llm-server
sudo systemctl status llm-server
```
