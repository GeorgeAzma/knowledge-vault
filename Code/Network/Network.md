---
aliases:
  - Internet
  - OSI
---
youtube.com/playlist?list=PLIFyRwBY_4bRLmKfP1KnZA6rZbRHtxmXi&si=X5VeT-UImBEcImdW
### Open Systems Interconnection (OSI) Model
Divides networking into 7 layers
1. **Physical** optical fiber cables, EM waves
2. [[Data Link]]
3. **Network**
	- [[IP]]
4. **Transport**
	- [[Port]]
	- [[TCP]]
	- [[UDP]]
5. **Session**
6. **Presentation**
7. **Application**
> [!note] Only Layers 1,2,3,4 are mandatory
### Sending Info Using OSI
Create a packet
``` 
+-------------+------------------+
| Source MAC  | Destination MAC  | <-- Layer 2 (Data Link) Mac Addresses
|-------------+------------------|
| Source IP   | Destination IP   | <-- Layer 3 (Network) IP Addresses
|-------------+------------------|
| Source Port | Destination Port | <-- Layer 4 (Transport) Ports + TCP or UDP
|-------------+------------------|
|             Data               |
+--------------------------------+
```
- Send an [[Address Resolution Protocol|ARP]] request `if you don't know destination/gateway's MAC`
	- Determine if you're sending info on [[Local Area Network (LAN)|LAN]] or [[Wide Area Network (WAN)|WAN]] using [[Subnet Mask]]
		- For [[Wide Area Network (WAN)|WAN]] use [[Default Gateway]]'s IP address `192.168.0.1`
		- For [[Local Area Network (LAN)|LAN]] use destination IP address directly `192.168.100.6`
	- Store Destination [[IP|IP]] to [[Address Resolution Protocol|ARP]] response MAC address mapping 
	  in ARP Cache of source device `192.168.0.1 -> 31:88:F1:3C:5A:CF`
- Fill data `0101011`
- Fill source/destination [[Port]][[s]] `TCP/25565 (Minecraft)`
  typically source [[Port]] is random and client 
  listens on it for response on this request
- Fill source/destination [[IP|IP]] addresses `192.168.100.3 | 192.168.100.6` ``
- Fill source [[Media Access Control (MAC) Address|MAC]] with your [[Data Link]]'s MAC address  `94:64:9C:3B:8A:E5`
- Fill destination [[Media Access Control (MAC) Address|MAC]] with next router [[Data Link]]'s [[Media Access Control (MAC) Address|MAC]] address `31:88:F1:3C:5A:CF`
- Once packet is delivered to next router, it replaces [[Media Access Control (MAC) Address|MAC]] layer
  with it's own [[Media Access Control (MAC) Address|MAC]] address and new next router [[Media Access Control (MAC) Address|MAC]] address
- Keep delivering to next routers until packet reaches destination IP
- Destination device removes [[IP|IP]] layer
- Destination device sends the packet to correct app using destination port
- App removes the [[Port]] layer and processes the data
### Extra Info
- **Socket** Hook into operating system's network drivers, you can use it to connect to endpoints, which are [[IP|IP]] + [[Port]]
- [[Domain Name System (DNS)]] Converts URL to [[IP|IP]]
- **Internet Service Provider (ISP)** `e.g. Magti`
- All host devices must have [[IP|IP Address]], [[Subnet Mask]] and [[Default Gateway]]
