---
aliases:
  - uvicorn
---
For hosting [[HTTP]] server/endpoints in python
### Install
``` bash
pip install fastapi uvicorn
```
### Code
``` python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return { "message": "hello" }

@app.get("/api/users")
def users():
    return { "users": ["Alice", "Bob"] }

@app.post("/users")
def create_user():
    return { "created": True }

@app.get("/users/{id}")
def get_user(id: int):
    return {"id": id}
    
@app.put("/users/{user_id}")
def update_user(user_id: int):
    return { "id": user_id }

@app.delete("/users/{user_id}")
def delete_user(user_id: int):
    return { "deleted": user_id }

@app.get("/search")
def search(q: str, limit: int = 10): # localhost/q=hello&search?limit=10
    return {"q": q, "limit": limit}

from pydantic import BaseModel

class User(BaseModel): # json request body
    name: str
    age: int

@app.post("/users")
def create_user(user: User):
    return {
        "name": user.name,
        "age": user.age
    }
```
##### Responses
``` python
from fastapi.responses import PlainTextResponse, HTMLResponse, FileResponse

return PlainTextResponse("hello")
return HTMLResponse("<h1>Hello</h1>")
return FileResponse("image.webp")
```
##### Serve
``` python
from fastapi.staticfiles import StaticFiles

# /static/style.css
# /static/image.webp
app.mount(
    "/static",
    StaticFiles(directory="static"),
    name="static"
)

# serve entire frontend (e.g. React dist/ folder)
app.mount(
    "/",
    StaticFiles(directory="dist", html=True),
    name="frontend"
)
```
##### [[Websocket]]
``` python
from fastapi import WebSocket

@app.websocket("/ws")
async def websocket(ws: WebSocket):
    await ws.accept()

    while True:
        data = await ws.receive_json()
        print(data)

        await ws.send_json({
            "received": data
        })
```
##### [[CORS]]
Useful when frontend and backend have different origins
``` python
from fastapi.middleware.cors import CORSMiddleware

# replace * with your origin
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)
```
### Run
``` bash
uvicorn main:app --host 0.0.0.0 --port 8000
```