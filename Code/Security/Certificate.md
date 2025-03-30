---
aliases:
  - Digital Certificate
---
Links [[Encryption#Asymmetric Encryption|Asymmetric Keys]] to an identity
Whoever owns private key of this public key is definetly example.com
because example.com is associated with this public key
in certificate signed by CA which is trusted by the client

Used for [[Transport Layer Security (TLS)#Purpose|Authentication]]

Certificates are given out and [[Signature|Signed]] by **Certificate Authority (CA)**
which is trusted by both client and server.
CAs have their own public/private keys and self [[Signature|Signed]] certificate
this certificate is super common so it's pre-installed 
in device's browsers for each CA

Servers can generate **Certificate Signing Request (CSR)**
which contains server's public key 
- CSR is [[Signature|Signed]] with server's private key
- Server gives CSR to CA
- CA validates the server's identity
- CA generates the certificate using server's public key
- CA signs certificate using its private key
- Signed certificate is sent back to the server
- Server can use this certificate to prove its identity to clients
- Client can decrypt the certificate using CA's public key
  to see that public key actually belongs to that server
  `as mentioned CA's public key is pre-installed`
- But server may not be who they say they are
  `because certificates are public knowledge`
  client needs to make sure that server has private key
  of the public key mentioned in the certificate
- This is done through **[[Transport Layer Security (TLS)|TLS]] Handshake**

Certificates can be purchased from CA
there are different kinds of certificates
- DV
- OV
- EV
### CAs That Secure The Internet
- **IdenTrust** `54%` `owns Let's Encrypt`
- **DigiCert** `19.4%` `owns GeoTrust, Verisign, Thawte`
- **Sectigo** `17.5%` `formally Comodo`
- **GoDaddy** `6.9%`
- **GlobalSign** `2.9%`
- **Other**s `2%`
