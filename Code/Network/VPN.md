---
aliases:
- Tailscale
- VPS
---

Virtual private network, similar to [[Proxy]], except all your traffic is [[Encryption|encrypted]] and sent to intermediary server and it is descripted only at the destination
### Tailscale
``` bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale set --operator my-user
tailscale up
```
