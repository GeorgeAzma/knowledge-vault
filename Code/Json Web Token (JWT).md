Used to send small data such that hackers can't change it
```python
import jwt

secret = "my-secret-key"

header = {
  "alg": "HS256",
  "typ": "JWT"
}

payload = {
  "iss": "youtube.com".
  "sub": "1dfee8d8-98a5-4314-b4ae-fb55c4b18845", 
  "aud": "api://my-api", 
  "role": "USER", 
  "exp": 1634814400, 
  "iot": 1634810800 
}

encoded_header = jwt.encode(header, secret, algorithm="HS256") 
encoded_payload = jwt.encode(payload, secret, algorithm="HS256")

signature = hmac.new(secret.encode(), encoded_header + "." + encoded_payload, hashlib.sha256).hexdigest()

jwt = encoded_header + "." + encoded_payload + "." + signature
```

### How it works
- Have a secret key (random long string)
- Make header and payload
- Encode header and payload
- Generate signature with encoded header and payload
- JWT = encoded_header.encoded_payload.signature
### Header
- alg: algorithm used to encode header and payload
- typ: type of header (always JWT)

### Payload
- iss: issuer of JWT
- sub: subject of JWT
- aud: audience of JWT
- exp: expiration time of JWT
- iat: issue time of JWT

> [!note]
> You can also add your own fields to JWT (called unregistered fields)
