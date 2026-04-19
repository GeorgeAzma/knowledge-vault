| Type    | Name                  | Function                          |
| ------- | --------------------- | --------------------------------- |
| `A`     | Address Record `IPv4` | maps `(sub)domain => IPv4`        |
| `AAAA`  | Address Record `IPv6` | maps `(sub)domain => IPv4`        |
| `CNAME` | Cannonical Record     | maps `(sub)domain => (sub)domain` |
| `MX`    | mail exchange         | maps `(sub)domain => mail server` |
> [!example] `MX example.com => ASPMX.L.GOOGLE.COM (gmail, priority 1)`
``` bash
dig google.com # lookup A record
dig +short google.com # answer short (with IP only)
dig google.com AAAA
dig google.com TXT
dig google.com MX
dig google.com ANY
dig @8.8.8.8 google.com # use specific dns server

host google.com # lookup A record (IPv4, IPv6, MX)
host -t MX google.com
```
