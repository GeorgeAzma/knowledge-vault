Connects [[Switch|Switches]], [[Data Link]][[s]] and other [[Router]][[s]] together
chooses best route for information, decides which devices
get priority, manages security and bandwidth limit etc

Routers are basically usual devices `PC/Mobile/Xbox`
but they never receive data directly, they only forward it
### Routing Table
Routers have [[IP|IP]] and [[Media Access Control (MAC) Address|MAC]] address 
for each [[Local Area Network (LAN)|LAN]] they are directly connected to
these addresses are stored in a routing table
##### Populating Routing Table
- **Directly Connected** directly connected to [[Local Area Network (LAN)|LAN]]
> [!example]
> - `IP = 10.0.55.x | LAN name = Left`
> - `IP = 10.0.44.x | LAN name = Right`
> When router recieves packet with [[IP|IP]]
> it sends to that [[IP|IP's]] [[Local Area Network (LAN)|LAN]] using routing table
> if routing table doesn't contain [[IP|IP's]] [[Local Area Network (LAN)|LAN]]
> it drops the packet
- **Static Routes** routes manually provided by admin
> [!example] 
> `10.0.44.x -> 10.0.55.1` forwards `10.0.44.x` traffic to `10.0.55.1`
> `10.0.55.1` is another router's [[IP|IP]] address so now it can decide
> where the packet goes using it's own routing table
- **Dynamic Routes** auto learned routes
> [!example]
> You can tell Router1 and Router2 to do dynamic routing
> and they will share their known [[IP|IPs]] from their routing tables
> amongst each other and add them to their own routing tables
> so when Router1 receives packet going to Router2's [[IP|IP]] address
> it will forward it to Router2
> > [!note] There are different dynamic routing protocols
> > - RIP
> > - OSPF
> > - BGP
> > - EIGRP
> > - IS-IS
