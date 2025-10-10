Request which asks anyone for destination [[IP|IP's]] [[Media Access Control (MAC) Address|MAC]]
ARP request contains
  - Source [[IP|IP]]/[[Media Access Control (MAC) Address|MAC]] `to respond to with destination MAC address`
  - Destination [[IP|IP]] address
  - Reserved destination [[Media Access Control (MAC) Address|MAC]] address `ff:ff:ff:ff:ff:ff`
    which is special address that broadcasts to everyone on [[Local Area Network (LAN)|LAN]]
### ARP Cache/Table
  Every device with [[IP|IP]] has ARP Cache which contains [[IP|IP]] to [[Media Access Control (MAC) Address|MAC]] mappings
  when a device receives ARP request it stores sender's [[IP|IP]] to [[Media Access Control (MAC) Address|MAC]] mapping
  and when sender receives response to their ARP request 
  they store destination's [[IP|IP]] to [[Media Access Control (MAC) Address|MAC]] mapping
