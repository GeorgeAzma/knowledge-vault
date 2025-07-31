[[Encryption#Symmetric Encryption|Symmetric Encryption]] needs a shared [[Encryption#Symmetric Encryption|Symmetric Key]] 
which needs to be transmitted over network to share
but anyone can listen to the network and steal sent key

**Diffie-Hellman** exchanges the shared secret securely without directly exchanging. 
that secret can be used as a seed to generate [[Encryption#Symmetric Encryption|Symmetric Key]]
or it can be used directly as a [[Encryption#Symmetric Encryption|Symmetric Key]]

**Diffie-Hellman** exchange is typically done each session
so if secret key gets leaked, only one session is compromised
### How It Works
- Agree on prime number $P$ `13`
- Agree on generator $G$ `6`
- Server/Client randomly generate their private keys $D$ `5,4`
- Server/Client generate public keys `E = G^D % P` `2,9`
- Exchange public keys
- Calculate shared secret `S = E^D % P` `secret is 3`
