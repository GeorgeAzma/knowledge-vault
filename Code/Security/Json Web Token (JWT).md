Used to send small data securely, ensuring [[Integrity]] and [[Authentication|Authenticity]]
```python
import jwt

secret = "my-secret-key"

header = {
  "alg": "HS256", # HMAC with SHA256
  "typ": "JWT"
}

payload = {
  "iss": "youtube.com".
  "sub": "1dfee8d8-98a5-4314-b4ae-fb55c4b18845", 
  "aud": "api://my-api", 
  "role": "USER", 
  "exp": 1634814400,
  "iat": 1634810800 
}

encoded_header = jwt.encode(header, secret, algorithm="HS256") 
encoded_payload = jwt.encode(payload, secret, algorithm="HS256")

signature = hmac.new(secret.encode(), encoded_header + "." + encoded_payload, hashlib.sha256).hexdigest()

jwt = encoded_header + "." + encoded_payload + "." + signature
```
### How it works
- Have a secret key `random long string`
- Encode header/payload `can use base64 if secrecy not required`
- Generate signature with encoded header/payload
- `JWT = encoded_header.encoded_payload.signature`
### Header
- **alg** algorithm used to encode header and payload
- **typ** type of header `always JWT`
### Payload
- **iss** issuer of JWT
- **sub** subject of JWT
- **aud** audience of JWT
- **exp** expiration time of JWT
- **iat** issue time of JWT
> [!note] You can also add your own fields to JWT `called unregistered fields`
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
- **Server**
    - verify JWT `using same secret key`
    - make sure JWT isn't expired using `exp + iot`
    - if valid process request
> [!notes]
> - **Stateless** server doesn't store any session info
> - If JWT is leaked attacker gains access `until JWT expires`
>   `so all attacker needs to do is access user localStorage/cookies`
> - JWT can be encrypted for secrecy or base64 encoded for
