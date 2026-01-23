``` html
<form action="/action_page.php">
  <label for="fname">First name:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  
  <label for="lname">Last name:</label><br>
  <input type="text" id="lname" name="lname" value="Doe"><br><br>
  
  <input type="submit" value="Submit">
</form> 
<!-- default text field max characters = 20 -->
<!-- form data sent to /action_page.php?fname=John&lname=Doe, for sensitive data use: -->
<form action="/action_page.php" method="POST"> <!-- field data sent via request body -->
```

<form action="/action_page.php">
  <label for="fname">First name:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="lname">Last name:</label><br>
  <input type="text" id="lname" name="lname" value="Doe"><br><br>
  <input type="submit" value="Submit">
</form> 
### Input Fields
``` html
<input type="text">
<input type="password">
<input type="email">
<input type="url">
<input type="tel">
<input type="number"> with min/max/step
<input type="range">  slider
<input type="search">
<input type="color">
<input type="date">
<input type="time">
<input type="datetime-local">
<input type="month">
<input type="week">
<input type="checkbox">
<input type="radio">
<input type="file">
<input type="hidden">
<input type="submit">
<input type="reset">
<input type="button">
```
### Form Elements
``` html
<textarea>	Multi-line text input
<select>	Dropdown list
<option>	Option inside <select>
<optgroup>	Group of options inside <select>
<button>	Button element (submit, reset, button)
<datalist>	Predefined options for <input list="">
<label>	    Label for inputs (clickable)
<fieldset>	Groups related fields
<legend>	Title for <fieldset>
<output>	Displays calculation results
```
### Field Properties
- `name` – key used when submitting form
- `value` – default value
- `placeholder` – hint text
- `required` – must be filled
- `readonly` – cannot edit
- `disabled` – cannot interact
- `multiple` – allows multiple selections `for <select> or <input type="file">`
- `checked` – default checked state `for checkbox/radio`
### Python
##### Flask
``` python

from flask import Flask, request

app = Flask(__name__)

# <form action="/submit_form" method="POST">
@app.route('/submit_form', methods=['GET', 'POST'])
def submit_form():
    # GET: data in request.args, POST: data in request.form
    if request.method == 'POST':
        fname = request.form['fname']
        lname = request.form['lname']
        return f"Hello {fname} {lname}"
    else:
        fname = request.args.get('fname')
        lname = request.args.get('lname')
        return f"Hello {fname} {lname}"

app.run(debug=True)
```
##### Raw
``` python
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import parse_qs

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path.startswith("/submit_form"):
            query = self.path.split("?", 1)[-1] if "?" in self.path else ""
            data = parse_qs(query)
            fname = data.get("fname", [""])[0]
            lname = data.get("lname", [""])[0]
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(f"Hello {fname} {lname}".encode())

    def do_POST(self):
        if self.path == "/submit_form":
            length = int(self.headers.get('Content-Length', 0))
            body = self.rfile.read(length).decode()
            data = parse_qs(body)
            fname = data.get("fname", [""])[0]
            lname = data.get("lname", [""])[0]
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(f"Hello {fname} {lname}".encode())

server = HTTPServer(("0.0.0.0", 8000), SimpleHandler)
server.serve_forever()
```
### Rust
``` rust
use tiny_http::{Server, Response, Request};
use std::str;

fn parse_form(body: &str) -> (String, String) {
    let mut fname = "".to_string();
    let mut lname = "".to_string();
    for pair in body.split('&') {
        let mut kv = pair.split('=');
        match (kv.next(), kv.next()) {
            (Some("fname"), Some(v)) => fname = v.replace('+', " "),
            (Some("lname"), Some(v)) => lname = v.replace('+', " "),
            _ => {}
        }
    }
    (fname, lname)
}

fn main() {
    let server = Server::http("0.0.0.0:8000").unwrap();
    println!("Server running on http://localhost:8000");

    for request in server.incoming_requests() {
        let response = handle_request(request);
        server.send_response(response).unwrap();
    }
}

fn handle_request(request: Request) -> Response<std::io::Cursor<Vec<u8>>> {
    if request.url() == "/submit_form" && request.method() == &tiny_http::Method::Post {
        let mut content = Vec::new();
        request.as_reader().read_to_end(&mut content).unwrap();
        let body = str::from_utf8(&content).unwrap_or("");
        let (fname, lname) = parse_form(body);
        let msg = format!("Hello {} {}", fname, lname);
        Response::from_string(msg)
    } else {
        Response::from_string("Use POST /submit_form").with_status_code(404)
    }
}
```