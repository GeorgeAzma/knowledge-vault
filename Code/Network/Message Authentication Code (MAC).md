---
aliases:
  - Hash Based Message Authentication Code
  - HMAC
---
[[Hashing|Hash]] of Message+[[Encryption#Symmetric Encryption|Symmetric Key]] used for [[Transport Layer Security (TLS)#Purpose|Authentication]] and [[Transport Layer Security (TLS)#Purpose|Integrity]]

- Server and client establish same [[Encryption#Symmetric Encryption|Secret Symmetric Key]]
- Client calculates hash from Message+Client's Key
	- **This is called Message Authentication Code (MAC)**
	  Standard implementation of MAC is
	  Hash Based Message Authentication Code (HMAC)
- Hash is attached to message and sent to server
- Server calculates hash from received Message+Server's Key
- If hashes match
	- **Integrity** message has not been modified
	- **Authentication** server and client have same [[Encryption#Symmetric Encryption|Secret Key]]
	  which only real server and client would now
Attacker can't modify message because he doesn't have a [[Encryption#Symmetric Encryption|Secret Key]]
