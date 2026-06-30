[[Encryption#Asymmetric Encryption|Private Key Encrypted]] message [[Code/Security/Hash|Hash]], used for sender's [[Authentication]] and message validating [[Integrity]]
### How It Works
- Alice hashes message and signs it using private key
- Alice sends message+signature to bob
- Bob decrypts signature using alice's public key
- Bob hashes alice's message and checks if his hash is same as decrypted signature hash from alice
	- **Integrity** message was not modified by middleman
	- **Authentication** Hash was actually encrypted using alice's private key which only real alice has
> [!note] 
> whilst middleman can modify the message and generate new hash
> it can't encrypt/sign the hash without alice's private key, to send to bob
