[[Certificate]]
``` bash
# generate self signed certificate
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/CN=localhost" 
-addext "subjectAltName=DNS:localhost,DNS:*.localhost,IP:127.0.0.1"

# key.pem: private key
# cert.pem: public key
# -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
# -addext: Subject Alternative Names (browsers require this)
```
### Trust Certificate
``` bash
Import-Certificate -FilePath "cert.pem" -CertStoreLocation Cert:\LocalMachine\Root

sudo cp cert.pem /etc/ca-certificates/trust-source/anchors/myapp.crt
sudo trust extract-compat
```
### Usage
##### Python
``` python
import http.server, ssl

server = http.server.HTTPServer(('localhost', 4443), http.server.SimpleHTTPRequestHandler)
ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
ctx.load_cert_chain('cert.pem', 'key.pem')
server.socket = ctx.wrap_socket(server.socket, server_side=True)
server.serve_forever()

import httpx
r = httpx.get("https://localhost:4443", verify="cert.pem")

import requests
r = requests.get("https://localhost:4443", verify="cert.pem")
```
##### FastAPI / Uvicorn
``` bash
uvicorn main:app --ssl-keyfile key.pem --ssl-certfile cert.pem --port 4443
```
##### Rust
`Cargo.toml`
``` toml
axum-server = { version = "0.7", features = ["tls-rustls"] }
```
`main.rs`
``` rust
use axum_server::tls_rustls::RustlsConfig;

#[tokio::main]
async fn main() {
    let config = RustlsConfig::from_pem_file("cert.pem", "key.pem")
        .await
        .unwrap();

    let app = axum::Router::new()
        .route("/", axum::routing::get(|| async { "Hello TLS!" }));

    axum_server::bind_rustls("0.0.0.0:4443".parse().unwrap(), config)
        .serve(app.into_make_service())
        .await
        .unwrap();
}
```
##### [[ComfyUI]]
``` bash
python main.py --tls-keyfile key.pem --tls-certfile cert.pem
```
