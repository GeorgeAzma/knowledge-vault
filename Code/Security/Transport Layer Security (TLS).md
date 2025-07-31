---
aliases:
  - Secure Sockets Layer
  - SSL
---
youtu.be/aCDgFH1i2B0?list=PLIFyRwBY_4bTwRX__Zn4-letrtpSj1mzY
> [!note] SSL an TLS are almost the same, TLS is newer

Protocol for safe communication over the network
### Purpose
- [[Confidentiality]]
- [[Integrity]]
- [[Authentication]]
- [[Non-Repudiation]]
- [[Anti-Replay]]
### How It Works
- At first uses [[Encryption#Asymmetric Encryption|Asymmetric Encryption]] 
  with limited message length and slow encryption, which handles
	- [[Confidentiality]] using [[Encryption#Asymmetric Encryption|Asymmetric Encryption]] algorithms
	- [[Integrity]]/[[Authentication]]/[[Non-Repudiation]] using [[Signature]][[s]]
	- [[Encryption#Symmetric Encryption|Symmetric Key Exchange]]
> [!note] Anyone can generate asymmetric keys
> to know for sure that asymmetric keys belong to server
> you are interested in, those keys need to have [[Certificate]]
> that links them to the server of interest to be trusted
- When symmetric keys are exchanged it uses
  [[Encryption#Symmetric Encryption|Symmetric Encryption]] for bulk messages and faster encryption, which does
	- [[Confidentiality]] using [[Encryption#Symmetric Encryption|Symmetric Encryption]]
	- [[Integrity]]/[[Authentication]]/[[Non-Repudiation]] 
	  using [[Message Authentication Code (MAC)]]
### TLS Handshake
- Client sends **Client Hello** message to the server with
	- **TLS Version** `0x0303 is TLS 1.2 and 0x0304 is TLS 1.3`
	- **Random Number** `256 bits`
		- Timestamp in seconds in first `32 bits`
		  so that 2 clients can't have same random number
		  if they are send 1 sec apart
	- **Session** ID `32 bits`
	  identifies this session, all 0s in initial `Client Hello`
	  or no session ID, meaning server will generate a random one
	- **Cipher Suites** can be multiple in the order that client prefers
	  and server will pick one that it supports
	  `TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA2`
	  **TLS** with **Elliptic Curve Diffie-Hellman (key) Exchange** using [[RSA Encryption]]
	  `Note: RSA can be used for both Key Exchange and Authentication`
	- **Extensions**
- Server responds with **Server Hello** message with exact same 5 fields
	- **TLS Version** highest that server supports
	- **Random Number** timestamp in seconds in first `32 bits`
	- **Session ID** randomly generated value `arbitrary`
	  `only if client didn't provide session ID`
	- **Cipher Suites** first one that server supports from client's cipher suites list
	- **Extension** info requried by extensions `if any`
- Server sends its [[Certificate|Digital Certificate]] to client to authenticate servers identity
  `can send multiple certificates`
- `(Optional) key exchange and client certificate request`
- Server sends **Server Hello Done** `which is empty`
- Client sends **Client Key Exchange** `using RSA key exchange` which
  - Generates **Pre-Master Secret** containing `384 bits`
	  - TLS Version `16 bits`
	  - Random `368 bits`
	Encrypted with server's public key
- If server is genuine it will have a private key to decrypt
  **Pre-Master Secret** to extract the random number
  now server/client have same secret random number 
- Server/Client generate **Master Secret** using **Pre-Master Secret** and
	- "master secret" string
	- Client Random
	- Server random
- **Master Secret** is used to generate session keys with
	- "key expansion" string
	- Client Random
	- Server Random
- Minimum 2 session keys are created for Server/Client each
	- [[Encryption#Symmetric Encryption|Symmetric Encryption]] key for [[Confidentiality]]
	- [[Message Authentication Code (MAC)]] for 
	  [[Integrity]]/[[Authentication]]/[[Non-Repudiation]]
	1st pair of session keys are used for server -> client communication
	2nd pair of session keys are used for client -> server communication
	So if server and client send same data, they are gonna look different
	on the network, giving extra security
- Client sends **Change Cipher Spec** indicating client is ready to speak securely
  `change cipher spec is not included in the handshake`
- Client sends **Finished** which proves to server that client has correct session keys
	- **Finished** contains **Encrypted Verification** value calculated with
	  Applying pseudo random function (which is similar to [[Hashing]]) to
	  - **Master Secret**
	  - "client finished" string
	  - [[Hashing]] all handshake records `does not include change cipher spec`
	    `this helps prove that all handshake records are untampered`
	 Result is encrypted with client session keys
- Server calculates the same **Encrypted Verification**  
  and checks if it matches with decrypted client's **Encrypted Verification**
- Server sends **Change Cipher Spec**
- Server sends its own **Encrypted Verification** `with "server finished" string`
- Client calculates the same **Encrypted Verification** 
  and checks if it matches with decrypted server's **Encrypted Verification** 
### Versions
- 1994 SSL 1.0
- 1995 SSL 2.0
- 1996 SSL 3.0
- 1999 TLS 1.0
- 2006 TLS 1.1
- 2008 TLS 1.2
- 2018 TLS 1.3
