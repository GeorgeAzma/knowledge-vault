``` 
+---------------------------------------------------------------+
|        Source Port 16b        |      Destination Port 16b     |
|---------------------------------------------------------------|
|                        Sequence Number 32b                    |
|---------------------------------------------------------------|
|                    Acknowledgement Number 32b                 |
|---------------------------------------------------------------|
| Data Offset 4b | Reserved 3b  |  Flags 9b  |    Window 16b    |
|---------------------------------------------------------------|
|         Checksum 16b          |      Urgent Pointer 16b       |
|---------------------------------------------------------------|
|   Options 0-320b 32b aligned  |   Padding 0-320b 32b aligned  |
|---------------------------------------------------------------|
|                              Data                             |
+---------------------------------------------------------------+
```
- **Sequence Number** for delivering packets in order
- **Acknowledgement Number** notifies sender about number of packets received
### Handshake
- **SYN** Client -> Server
  - **SYN** flag set
  - **Sequence Number** set to $x$ 
- **SYN-ACK** Server -> Client
  - **SYN and ACK** flags set
  - **Sequence Number** set to new random number $y$
  - **Acknowledgement Number** set to $x+1$
- **ACK** Client -> Server
  - **ACK** flag set
  - **Sequence Number** set to $x+1$
  - **Acknowledgement Number** set to $y+1$
Connection established
### Handshake Purpose 
- Know that client and server are really correctly 
  trying to connect to each other for shared interest and it's not a fluke
- Negotiate parameters like message encryption method etc
- Ensure that identity of parties involved is legitimate and secure
- Ensure that communication packets are received correctly
### TCP Slow Start
There is no way to know how much TCP can send without packets being dropped
so it starts by sending [[MTU|10 Segments]]  `which is a safe bet` 
without waiting for acknowledgement, everytime sent segments get acknowledged
TCP sends more unacknowledged segments `typically doubles each time`
when packets start getting dropped, is when it stops doubling
[[MTU|MSS]] is `1460 bytes` and 10 segments are sent initially, that is `14.6KB` sent at once
after that it has to wait for acknowledgement adding more latency
so good practice is to have your data be under `14.6 KB` for minimum latency

