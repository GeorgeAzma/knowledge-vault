> [!example] [[Json Web Token (JWT)]]
``` http
GET api.example.com/ HTTP 1.1
Authorization: Bearer <token>
```

**token leaked = full access to API** so bearer tokens have 
**short-lifespan** and are securely transmitted over [[HTTPS]]
