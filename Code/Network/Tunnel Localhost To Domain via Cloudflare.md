- purchase domain `cloudflare ~$10/year`
- install `cloudflared`
- run `cloudflared's` windows service
- `cloudflared login`
- `cloudflared tunnel create <tunnel-name>`
- create config file in `~/.cloudflared/config.yml`
``` yaml
tunnel: <tunnel-name>
credentials-file: C:\Users\User\.cloudflared\<some-hash>.json

ingress:
  - hostname: <domain-url>
    service: 127.0.0.1:8080
  - service: http_status:404
```
- `cloudflared tunnel route dns <tunnel-name> <domain-url>`
  (or manually add record from cloudflare dashboard)
- `cloudflared tunnel run <tunnel-name>`

`lumiey.uk` effectively acts as reverse proxy redirecting to `localhost:8080`
### Host Subdomains
- `cloudflared tunnel route dns <tunnel-name> <subdomain>.<domain-url>`
``` yaml
tunnel: <tunnel-name>
credentials-file: C:\Users\User\.cloudflared\<some-hash>.json

ingress:
  - hostname: <domain-url>
    service: 127.0.0.1:8080
  - hostname: chat.<domain-url>
    service: 127.0.0.1:8080
  - hostname: image.<domain-url>
    service: 127.0.0.1:8188
  - hostname: tts.<domain-url>
    service: 127.0.0.1:5000
  - hostname: stt.<domain-url>
    service: 127.0.0.1:5001
    
  - service: http_status:404
```
### Docker
- do above steps `except tunnel run`
- create working directory
- add `docker-compose.yml`
``` powershell
  tunnel:
    image: cloudflare/cloudflared:latest
    command: tunnel run --protocol http2 --token ${TUNNEL_TOKEN}
    restart: unless-stopped
    depends_on:
      - your-localhost-service
```
- add `.env`
``` yaml
# run `cloudflared tunnel token`
TUNNEL_TOKEN=<tunnel-token>
```
- `docker-compose up -f <path>/docker-compose.yml`
