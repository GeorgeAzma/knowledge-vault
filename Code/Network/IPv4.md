![[IPv4.webp#rounded|620]]

| Class |    Start    |        End        | Private Range   | Subnet Mask     | Slash | Bitmask | Usage           |
| :---: | :---------: | :---------------: | --------------- | --------------- | ----- | ------- | --------------- |
|   A   |  `0.0.0.0`  | `127.255.255.255` | `10.x.x.x`      | `255.0.0.0`     | `/8`  | `0`     | big networks    |
|   B   | `128.0.0.0` | `191.255.255.255` | `172.16-31.x.x` | `255.255.0.0`   | `/16` | `10`    | medium networks |
|   C   | `192.0.0.0` | `223.255.255.255` | `192.168.x.x`   | `255.255.255.0` | `/24` | `110`   | small networks  |
|   D   | `224.0.0.0` | `239.255.255.255` |                 | `255.0.0.0`     | `/8`  | `1110`  | multicast       |
|   E   | `240.0.0.0` | `255.255.255.255` |                 | `255.255.0.0`   | `/16` | `1111`  | reserved        |
- **Public Ranges** never reused or changed, they are assigned by Internet Service Providers (ISP) and cost money
- **Private Ranges** pings from the internet are not routed. free to change/reuse in different [[Local Area Network (LAN)|LAN]] [[Network]][[s]]
### Quirks
- **loobpack address** `127.0.0.1 or localhost` used for computer to refer to itself
- **all host bits = 1** `192.168.1.255/24` is broadcast address, which forwards packet to all hosts
- **all host bits = 0** `192.168.1.0/24` is network address, all hosts `192.168.1.x` are seen as net address from outside
-  **CGNAT range** `100.64.0.0/10-100.127.255.255`