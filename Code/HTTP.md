### GET
```
GET /subdomain/path?user=john&pswd=123 HTTP/1.1
Host: example.com
Accept: text/css text/html
User-Agent: Mozilla/5.0
```
### POST
```
POST /upload/subdomain HTTP/1.1
Host: example.com
Content-Type: application/json
Content-Length: 15
{"msg": "Hello World"}
```
