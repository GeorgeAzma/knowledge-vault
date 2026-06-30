---
aliases:
  - Digital Certificate
---
Links [[Encryption#Asymmetric Encryption|Asymmetric Keys]] to an identity, whoever owns private key of this public key is definetly `example.com`, 
because `example.com` is associated with this public key in certificate signed by CA which is trusted by the client

Used for [[Transport Layer Security#Purpose|Authentication]]

Certificates are given out and [[Signature|signed]] by **Certificate Authority (CA)**, who is trusted by both client and server
CAs have their own public/private keys and [[self signed certificate]] this certificate is super common so it's pre-installed on browsers for each CA

### How Server Gets Certificate
**Certificate Signing Request(CSR)**
``` python
# =====================================================
# SERVER
# =====================================================

csr = RSA.Encrypt( # server signs it's public key
    data = server.public_key
    key = server.private_key
)

# send CSR to Certificate Authority
send_to_CA(CertificateSigningRequest(
    csr        = csr,
    subject    = "server.com",
    public_key = server.public_key
))

# =====================================================
# CA RECEIVES CSR
# =====================================================

decrypted_public_key = RSA.decrypt(  # verify CSR came from server
    data = csr,
    key  = csr.public_key        # only works if signed with matching private key
)

assert decrypted_public_key == csr.public_key

CA.validate_identity("server.com") # domain ownership, DNS checks, etc.

certificate = {
    "subject"   : "server.com",
    "public_key": csr.public_key, # = decrypted_public_key
    "issuer"    : "TrustedCA",
    "expires"   : "2029-01-01",
}

certificate["signature"] = RSA.encrypt(  # CA signs the certificate
    data = hash(certificate),
    key  = CA.private_key # every device has CA's public key pre-installed so they can decrypt certificate hash
)

send_to_server(certificate)

# =====================================================
# CLIENT VALIDATES SERVER CERTIFICATE
# =====================================================

# CA public key comes pre-installed in OS/browser trust store
decrypted_hash = RSA.decrypt(
    data = certificate["signature"], # certificate received from server (typically during TLS handshake)
    key  = CA.public_key # pre-installed, trusted
)

assert decrypted_hash == HASH(certificate) # certificate is legit, not tampered

server.public_key = certificate["public_key"] # now client trusts this key belongs to server.com

# =====================================================
# BUT CERTIFICATE ALONE IS NOT ENOUGH
# =====================================================

# certificates are public — anyone could present one
# client must prove server actually holds the private key
# this is done through TLS Handshake
```

Servers can generate **Certificate Signing Request (CSR)** which contains server's public key 
- CSR is [[Signature|signed]] with server's private key and sent to CA
- CA validates the server's identity
- CA generates the certificate using server's public key
- CA signs certificate using its private key
- Signed certificate is sent back to the server
- Server can use this certificate to prove its identity to clients
- Client can decrypt the certificate using CA's public key `pre-installed` to see that public key actually belongs to that server
- But server may not be who they say they are `because certificates are public knowledge`
     client needs to make sure that server has private key of the public key mentioned in the certificate
- This is done through **[[Transport Layer Security|TLS]] Handshake**

Certificates can be purchased from CA, there are different kinds of certificates
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
### [[Self Signed Certificate]]
