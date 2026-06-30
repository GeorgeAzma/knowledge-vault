---
aliases:
  - Secure Sockets Layer
  - SSL
  - TLS
---
youtu.be/aCDgFH1i2B0?list=PLIFyRwBY_4bTwRX__Zn4-letrtpSj1mzY
> [!note] SSL an TLS are almost the same, TLS is newer

Protocol for safe communication over the network
### Purpose
- [[Confidentiality]] `data is only accessible by server and client`
- [[Non-Repudiation]] `prevents client lying about never sending the message`
    - [[Integrity]] `data is guaranteed to be unmodified by middleman`
    - [[Authentication]] `ensure server/client is actually who it says it is`
- [[Anti-Replay]] `prevents message duplication, using **Sequence Numbers**`
### How It Works
- At first uses [[Encryption#Asymmetric Encryption|Asymmetric Encryption]] with limited message length and slow encryption, which handles
	- [[Confidentiality]] using [[Encryption#Asymmetric Encryption|Asymmetric Encryption]] algorithms
	- [[Integrity]]/[[Authentication]]/[[Non-Repudiation]] using [[Signature]][[s]]
	- [[Encryption#Symmetric Encryption|Symmetric Key Exchange]]
> [!note] Anyone can generate asymmetric keys
> to know for sure that asymmetric keys belong to server you are interested in, 
   those keys need to have [[Certificate]] that links them to the server of interest to be trusted
- When symmetric keys are exchanged it uses [[Encryption#Symmetric Encryption|Symmetric Encryption]] for faster encryption, guaranteeing
	- [[Confidentiality]] via [[Encryption#Symmetric Encryption|Symmetric Encryption]]
	- [[Integrity]]/[[Authentication]]/[[Non-Repudiation]] via [[Message Authentication Code]]
### TLS Handshake
``` python  
# =====================================================  
# CLIENT  
# =====================================================

client.cipher_suites = [
    "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA256", # TLS with Elliptic Curve Diffie-Hellman (key) Exchange using RSA encryption
    "TLS_RSA_WITH_AES_128_CBC_SHA256"
]

send_to_server(ClientHello(
    version = TLS_1_2 # TLS_1_2 = 0x0303, TLS_1_3 = 0x0304
    random = timestamp_bits(32) + random_bits(224) # timestamp avoids 2 clients having same random number
    session_id = zero_bits(32) # ask server to create one
    cipher_suites = client.cipher_suites # ordered by preference, server picks one it supports
    extensions = { ... }
)) # sends over raw TCP/IP channel

# =====================================================  
# SERVER RECEIVES CLIENT HELLO  
# =====================================================

send_to_client(ServerHello(
    version = highest_supported(client.tls_version)
    random = timestamp_bits(32) + random_bits(224)
    session_id = random_bits(32) if !client.session_id else client.session_id
    cipher_suite = first_supported(client.cipher_suites)  
    extensions = negotiate_extensions(client.extensions)
))
send_to_client(Certificate(cert_chain = server.certificates))
  
# optional:  
# send_to_client(ServerKeyExchange())  
# send_to_client(CertificateRequest())
send_to_client(ServerHelloDone())
  
# =====================================================  
# CLIENT VALIDATES SERVER CERTIFICATE  
# =====================================================

verify_certificate_chain(server.certificates)
server.public_key = extract_public_key(  
    server.certificates  
)  
  
# =====================================================  
# CLIENT KEY EXCHANGE (RSA example)  
# =====================================================

pre_master_secret = (  
    TLS_1_2 + # 16 bits
    random_bits(368)
) # total 384 bits

encrypted_pms = RSA.encrypt(  
    server.public_key, # only server can decrypt it
    pre_master_secret
)

send_to_server(ClientKeyExchange(  
    encrypted_pre_master_secret = encrypted_pms  
))

# =====================================================  
# SERVER DECRYPTS PRE-MASTER SECRET  
# =====================================================  

pre_master_secret = RSA.decrypt(  
    server.private_key,  
    encrypted_pms  
) # now server/client have same random number
  
# =====================================================  
# BOTH SIDES DERIVE MASTER SECRET  
# =====================================================

master_secret = PRF( # HMAC_SHA256 Pseudo Random Function
    secret = pre_master_secret,
    label = "master secret",  
    seed = client.random + server.random
) # used to generate session keys with: "key expansion" + client.random + server.random

# =====================================================  
# BOTH SIDES EXPAND INTO SESSION KEYS  
# =====================================================

key_block = PRF(  
    secret = master_secret,  
    label = "key expansion",  
    seed = server.random + client.random  
)  

keys = split(key_block, into=[  
    client_mac_key, # integrity  (client → server)
    server_mac_key, # integrity  (server → client)
    client_enc_key, # encryption (client → server)
    server_enc_key, # encryption (server → client)
    client_iv, # client encryption randomness, avoids encrypt("hello") always having same signature
    server_iv, # server encryption randomness, avoids encrypt("hello") always having same signature
]) # separate (client → server) & (server → client) keys are used so that when server and client send same data, they look different

# =====================================================  
# CLIENT SWITCHES TO ENCRYPTED MODE  
# =====================================================  

handshake_hash = HASH(all_handshake_messages())  

send_to_server(ChangeCipherSpec())  
  
client_verify_data = PRF(  
    secret = master_secret,  
    label = "client finished",  
    seed = handshake_hash  
)  
  
encrypted_finished = encrypt_with_client_keys(client_verify_data)  
  
send_to_server(Finished(
    verify_data = encrypted_finished
))  

# =====================================================  
# SERVER VERIFIES CLIENT  
# =====================================================  
  
expected = PRF(  
    secret = master_secret,
    label = "client finished",
    seed = handshake_hash
)

received = decrypt_with_client_keys(encrypted_finished)
  
assert received == expected

# =====================================================  
# SERVER SWITCHES TO ENCRYPTED MODE  
# =====================================================  

send_to_client(ChangeCipherSpec())

server_verify_data = PRF(
    secret = master_secret,
    label = "server finished",
    seed = handshake_hash
)
  
encrypted_finished = encrypt_with_server_keys(server_verify_data)

send_to_client(Finished(  
    verify_data = encrypted_finished  
))

# =====================================================  
# CLIENT VERIFIES SERVER  
# =====================================================  
  
expected = PRF(  
    secret = master_secret,  
    label = "server finished",  
    seed = handshake_hash  
)  

received = decrypt_with_server_keys(  
    encrypted_finished  
)  

assert received == expected
  
# =====================================================  
# SECURE CHANNEL READY  
# =====================================================  
  
# client <==== encrypted authenticated traffic ====> server
```
[[Encryption]] | [[RSA Encryption]] | [[Diffie-Hellman]] | [[Certificate]] | [[Code/Security/Hash]] | [[SHA256]] | [[Message Authentication Code|HMAC]] | [[Signature]]
### [[Linux]] Usage
``` bash
# self signed certificate, gonna ask for some personal info
openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 1 -nodes

# - listens TCP port 4433
# - does TLS handshake with clients
# - prints decrypted input to stdout
# - sends stdin back to client
openssl s_server -accept 4433 -cert cert.pem -key key.pem # -key private key

# - opens TCP socket with <host> app at <port> (443 for https, which uses TLS)
# - does TLS handshake with the <host>
# - outputs decrypted traffic to stdout
openssl s_client -connect localhost:4433

# (server <-> client) connection established, you can send messages from server or client

openssl s_client -connect localhost:4433 -tls1_2 -state -msg -showcerts # handshake details
```
[[HTTPS]] is just [[HTTP]] sent over TLS
### Versions
- 1994 SSL 1.0
- 1995 SSL 2.0
- 1996 SSL 3.0
- 1999 TLS 1.0
- 2006 TLS 1.1
- 2008 TLS 1.2
- 2018 TLS 1.3
