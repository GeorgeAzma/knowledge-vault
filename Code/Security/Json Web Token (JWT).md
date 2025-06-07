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
  # can also add your own fields called "unregistered fields"
}

encoded_header = jwt.encode(header, secret, algorithm="HS256") 
encoded_payload = jwt.encode(payload, secret, algorithm="HS256")

# signature part, also called JWS (Json Web Signature)
signature = hmac.new(secret.encode(), encoded_header + "." + encoded_payload, hashlib.sha256).hexdigest()

jwt = encoded_header + "." + encoded_payload + "." + signature
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
