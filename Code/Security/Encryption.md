---
aliases:
  - Symmetric Cryptography
  - Asymmetric Cryptography
---
### Symmetric Encryption
Alice and Bob have the shared public key, which they use to encrypt and decrypt information they are sending to each other
> [!warning] 
> This means alice has to share his key with bob through the network which can be intercepted by a hacker
> so key sharing is typically done through secure [[#Asymmetric Encryption]] first
- AES `128,192,256 bit key`
- ChaCha20 `128,256 bit key`
- 3DES `168 bit key`
### Asymmetric Encryption
Alice and Bob have the shared public key and separate private key.
Information encrypted by private key can only be decrypted with public key
Information encrypted by public key can only be decrypted with private key
> [!warning] [[RSA Encryption]] is valnurable to quantum computers
- [[RSA Encryption|RSA]] `recommended key size 2048 bits`
- [[Diffie-Hellman]]
- [[Digital Signature Algorithm]]
- Elliptic Curve [[Digital Signature Algorithm|DSA]] `ECDSA`
- Elliptic Curve Diffie-Hellman `ECDH`
> [!tip] 
> Asymmetric encryption can be used for [[Transport Layer Security (TLS)#Purpose|Authentication And Integrity]]
> See [[Signature]] for more info

> [!example] Messaging app
> - Each user generates their public and private keys locally
> - Public key is uploaded into messaging app's database server
> - Private key is never shared
> - Message sender obtains recipient's public key from messaging app's server
> - Sender encrypts their message using recipient's public key
> - Sender sends encrypted message to the messaging app's server
> - Server forwards the message to the recipient
> > [!note] 
> > Server can't decrypt the message without recipient's private key
> > and private key is never shared so message is safe
> - Recipient decrypts received message using their private key
> > [!note] 
> > For [[RSA Encryption]], public and private keys are large primes
> > and it works out mathematically that information encrypted 
> > by public key can only be decrypted by private key and vice versa
### Hybrid Encryption
Since symmetric is much faster but asymmetric is more secure
Asymmetric encryption can be used to share symmetric key
and symmetric encryption can be used from then on for fast communication
> [!note] [[Transport Layer Security (TLS)]] and SSH do this
### Simple Encryption
Simple encryption uses encryption algorithm to encrypt sent message 
this is insecure because if attacker knows your encryption algorithm
or you send 2 users message encrypted with same encryption algorithm
they are going to know how to decrypt the message
so encryptions like [[RSA Encryption|RSA]] use unique keys for each recipient that you send to
so attacker and 2nd user have to know the unique key to be able to decrypt
