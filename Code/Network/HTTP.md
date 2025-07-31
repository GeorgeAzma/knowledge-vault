uses port `80`
### GET
```
GET /subdomain/path?user=john&pswd=123 HTTP/1.1
Host: example.com
Accept: text/css text/html
User-Agent: Mozilla/5.0
\r\n
\r\n
```
### POST
```
POST /upload/subdomain HTTP/1.1
Host: example.com
Content-Type: application/json
Content-Length: 22
\r\n
{"msg": "Hello World"}
```
### JS Fetch
``` js
await fetch('127.0.0.1:11434/api/generate', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
      'model': 'deepseek-r1:1.5b',
      'prompt': 'hey',
  })
})
.then(data => data.text())
.then(data => console.log(data))
.catch(error => console.error('Error:', error));
```
