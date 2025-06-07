[[Encryption#Asymmetric Encryption|Private Key Encrypted]] message [[Hashing|Hash]], used for sender's [[Authentication]] and message validating [[Integrity]]
### How It Works
- Message is hashed using alice's private key to get a signature
- Message+signature is sent to bob
- bob decrypts signature `and message if it was encrypted` using alice's public key
- bob generates hash from decrypted message
- If hash matches decrypted signature `which is just alice's message hash`
	- **Integrity** message was not modified by middleman
	- **Authentication** Hash was actually encrypted using alice's private key which only real alice has
> [!note] 
> whilst middleman can modify the message and generate new hash
> it can't encrypt it without alice's private key, to send to bob
