![[IPv4.webp#rounded|620]]

| Class |    Start    |        End        | Subnet Mask     | Private Range   | Usage           |
| :---: | :---------: | :---------------: | --------------- | --------------- | --------------- |
|   A   |  `0.0.0.0`  | `127.255.255.255` | `255.0.0.0`     | `10.x.x.x`      | big networks    |
|   B   | `128.0.0.0` | `191.255.255.255` | `255.255.0.0`   | `172.16-31.x.x` | medium networks |
|   C   | `192.0.0.0` | `223.255.255.255` | `255.255.255.0` | `192.168.x.x`   | small networks  |
|   D   | `224.0.0.0` | `239.255.255.255` | `255.0.0.0`     |                 | multicast       |
|   E   | `240.0.0.0` | `255.255.255.255` | `255.255.0.0`   |                 | reserved        |
- **Public Ranges** never reused or changed, they are assigned by Internet Service Providers (ISP) and cost money
- **Private Ranges** pings from the internet are not routed. free to change/reuse in different [[Local Area Network (LAN)|LAN]] [[Network]][[s]]
### Loopback IP Address `127.0.0.1` or `localhost`
Used for computer to refer to itself and send itself data packets
