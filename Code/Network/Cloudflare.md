- [[Tunnel Localhost To Domain via Cloudflare]]
### Record Types

| Type    | Name                  | Function                          |
| ------- | --------------------- | --------------------------------- |
| `A`     | Address Record `IPv4` | maps `(sub)domain => IPv4`        |
| `AAAA`  | Address Record `IPv6` | maps `(sub)domain => IPv4`        |
| `CNAME` | Cannonical Record     | maps `(sub)domain => (sub)domain` |
| `MX`    | mail exchange         | maps `(sub)domain => mail server` |
> [!example] `MX example.com => ASPMX.L.GOOGLE.COM (gmail, priority 1)`
