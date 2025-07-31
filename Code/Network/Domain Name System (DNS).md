Converts URL to IP
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
