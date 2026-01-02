Used to send small data securely, ensuring [[Integrity]] and [[Authentication|Authenticity]]
```python
import jwt

secret = "my-secret-key"

header = {
  # algorithm used to encode header/payload 
  "alg": "HS256", # HMAC with SHA 256, can use base64 if secrecy not required
  "typ": "JWT" # type is always JWT
}

payload = {
  "iss": "youtube.com". # issuer
  "sub": "1dfee8d8-98a5-4314-b4ae-fb55c4b18845", # subject 
  "aud": "api://my-api",  # audience
  "role": "USER",
  "exp": 1634814400, # expiration time
  "iat": 1634810800 # issue time
  # add your own "unregistered fields"
}

header_b64 = base64.encode(header) 
payload_b64 = base64.encode(payload)

# signature part, also called JWS (Json Web Signature)
signature = hmac.sha256(secret.bytes(), header_b64 + "." + payload_b64)

jwt = header_b64 + "." + payload_b64 + "." + signature
```
### Login via JWT
- **Log In**
    - user sends username/password
    - server checks it in database `for validity`
- **Server**
    - generate secret key `random string or using key management system`
    - sign JWT via secret key `jwt contains user data (id, role)`
    - send JWT to client
- **Client**
    - store JWT as `localStorage` or `cookies`
    - include JWT in subsequent [[HTTP]] requests `Authorization: Bearer <token>`
- **Server** `stateless, doesn't store any info except private key`
    - verify JWT `using same secret key`
    - make sure JWT isn't expired using `exp + iot`
    - `if expired might use refresh token to get new JWT access token`
    - if valid process request
> [!warning] If JWT is leaked attacker gains access until JWT expires
>   So all attacker needs to do is access user localStorage/cookies
