---
aliases:
  - Hash Based Message Authentication Code
  - HMAC
  - MAC
---
[[Code/Security/Hash|Hash]] of Message+[[Encryption#Symmetric Encryption|Symmetric Key]] used for [[Transport Layer Security#Purpose|Authentication]] and [[Transport Layer Security#Purpose|Integrity]]

- Server and client establish same [[Encryption#Symmetric Encryption|Secret Symmetric Key]]
- Client calculates hash from Message+Key
	- **This is called Message Authentication Code (MAC)**
	      standard implementation of MAC is Hash Based Message Authentication Code (HMAC)
- Hash is attached to message and sent to server
- Server calculates hash from received Message+Key
- If hashes match, that means both server/client messages and keys match
	- **Integrity** message has not been modified
	- **Authentication** server and client have same [[Encryption#Symmetric Encryption|Secret Key]] which only real server and client would know
Attacker can't modify message because he doesn't have a [[Encryption#Symmetric Encryption|Secret Key]] to encrypt the new [[Code/Security/Hash|hash]] with