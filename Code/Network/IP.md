### [[IPv4]]
### [[IPv6]]

|                     Field                     | Size`bits` |                   Purpose                    |
| :-------------------------------------------: | :--------: | :------------------------------------------: |
|                  **Version**                  |     4      |           IP version `4 for IPv4`            |
|       **IHL** `Internet Header Length`        |     4      |       Length of header in 32-bit words       |
| **DSCP** `Differentiated Services Code Point` |     6      |            QoS/priority handling             |
|  **ECN** `Explicit Congestion Notification`   |     2      |             Congestion signaling             |
|               **Total Length**                |     16     | Total size of IP packet <br>`header + data`  |
|              **Identification**               |     16     |      Used for fragmentation/reassembly       |
|                   **Flags**                   |     3      |        Fragmentation control (DF, MF)        |
|              **Fragment Offset**              |     13     |     Fragment position in original packet     |
|            **TTL** `Time To Live`             |     8      |         Hop limit before discarding          |
|                 **Protocol**                  |     8      | Upper-layer protocol <br>`6 = TCP, 17 = UDP` |
|              **Header Checksum**              |     16     |         Error check for header only          |
|             **Source IP Address**             |     32     |            Sender’s IPv4 address             |
|          **Destination IP Address**           |     32     |           Receiver’s IPv4 address            |
32 bit device address `251.31.159.3 (IPv4)` used for device to device `End to End` delivery
each device/host `meaning PC/Mobile but not routers/switches` has IP address
which is like home address, to assist [[Switch|Switches]]/[[Router]][[s]] to deliver data to correct destination