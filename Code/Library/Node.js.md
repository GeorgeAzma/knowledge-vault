``` js
import http from 'http';
// req = read stream; res = write stream
http.createServer((req, res) => res.end('hello')).listen(3000);
```
### Request
``` js
req.url         // /api/data?x=1
req.method      // GET / POST / PUT
req.headers     // { host: 'localhost:3000', 'content-type': 'application/json' }
req.httpVersion // 1.1
req.socket      // underlying tcp socket
req.query       // parsed url params (x=1). parsed via url.parse(req.url, true)
req.params      // path params if using routing { 'id': 1 }
req.rawHeaders  // ['Host', 'localhost:3000', 'Content-Type','application/json']
req.cookies     // { session: 'abc123' }

req.socket.remoteAddress

req.on('data', chunk => {}) // call fn per request body chunk
req.on('end', () => console.log("request body fully received"))
req.on('error', err => console.error(err))

req.pipe(res) // send request as response
req.pipe(http.request({ host: 'localhost', port: 8000, path: req.url, method: req.method }, r => r.pipe(res))
```
### Response
``` js
res.statusCode    // 404
res.statusMessage // 'Not Found'

res.socket.localPort

res.writeHead(status: 200, headers: {'Content-Type':'text/plain'})
res.setHeader(name: 'X-Custom', value: '123')
res.getHeader('content-type')
res.removeHeader('x-custom')
res.on('error', err => console.error(err))

res.write(chunk)
res.end([last_chunk_optional])
res.writableEnded // true if end() called
res.socket
res.on('finish', () => console.log('response fully sent'))
```
### URL
``` js
import { parse, format } from 'url'; 

const url = new URL('http://localhost:3000/api/data?x=1');
url.pathname // /api/data
url.searchParams.get('x') // 1
url.searchParams.append('y','2'); 
url.toString() // http://localhost:3000/api/data?x=1&y=2

////// OLDER API //////
const url = parse(req.url, true); 

const url_str = format({ 
    protocol: 'http', 
    hostname: 'localhost', 
    port: 3000, 
    pathname: '/api', 
    query: { x: 1 } 
}); // http://localhost:3000/api?x=1

const params = new URLSearchParams('x=1&y=2'); 
params.get('x') // '1'
params.set('z','3') 
params.toString() // 'x=1&y=2&z=3'
```
### TCP
``` js
import net from 'net'; 

net.createServer(server => server.on('data', chunk => server.write(chunk))).listen(4000)

const client = net.connect({ port: 4000 }); 
c.write('hi'); 
c.on('data', chunk => console.log(chunk.toString()))
```
