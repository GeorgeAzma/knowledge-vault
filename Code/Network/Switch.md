Connects [[Data Link]][[s]] together 
exists so that each [[Data Link]] doesn't have to connect to every 
other [[Data Link]] and they can just connect to a single switch
### [[Media Access Control (MAC) Address|MAC Address]] Table
Contains mapping of each ethernet [[Port]] index 
to connected [[Data Link]] [[Media Access Control (MAC) Address|MAC Address]] for efficiency
it starts empty and as packets flow through it
with [[Media Access Control (MAC) Address|MAC Address]] layers it uses those to populate the table
### Actions
- **Learn** listen to data on different ethernet ports
  and save senders [[Media Access Control (MAC) Address|MAC Address]] in [[Media Access Control (MAC) Address|MAC Address]] Table
- **Flood** If [[Media Access Control (MAC) Address|MAC Address]] Table does not contain recipients [[Media Access Control (MAC) Address|MAC Address]] 
  Send data to all connected devices except one sending the data
- **Forward** If [[Media Access Control (MAC) Address|MAC Address]] Table contains recipients [[Media Access Control (MAC) Address|MAC Address]]
  send data to only that recipient
> [!note] For [[Address Resolution Protocol|ARP]] requests switch is flooded
