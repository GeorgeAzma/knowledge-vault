Domain Name System, Converts URL to IP
### How It Works
- Client searches for URL
- URL goes to ISP's Recursive Resolver
- Resolver goes to Root Nameserver
- It tells Resolver which [[Top Level Domain (TLD)|TLD]] nameserver to go to
- Resolver goes to that [[Top Level Domain (TLD)|TLD]] nameserver
- It tells Resolver which Authoritative nameserver to go to
- Resolver goes to that Authoritative nameserver
- It tells what IP the URL is
- Resolver sends back the IP to the Client
> [!note] DNS can also convert email to mail server IP

``` bash
nslookup google.com # DNS IP Address lookup
nslookup google.com 1.1.1.1 # using specific DNS server
dig +short google.com # DNS IP Address lookup (short)
nslookup 8.8.8.8 # reverse dns lookup (dns.google)
host 8.8.8.8 # reverse dns lookup (dns.google)
```
### Add DNS Resolution
[[Linux]] `/etc/hosts`
[[Windows Commands|Windows]] `C:\Windows\System32\drivers\etc\hosts`
```
192.168.100.2 my-domain.local
```
