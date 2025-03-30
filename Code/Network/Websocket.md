``` typescript
import { WebSocket, WebSocketServer } from 'ws';

const wss: WebSocketServer = new WebSocketServer({ port: 8080 }, () => {
    console.log('websocket server is listening on port 8080');
});

wss.on('connection', (ws: WebSocket) => {
    console.log('client connected');
    ws.send('welcome to the websocket server!');

    ws.on('message', (message: WebSocket.Data) => {
        const msg = message.toString();
        console.log(`received: ${msg}`);
        ws.send(`echo: ${msg}`);
    });

    ws.on('close', () => {
        console.log('client disconnected');
    });

    ws.on('error', (error) => {
        console.error(`client-side websocket error: ${error}`);
    });
});

// server-side errors (e.g. port already in use)
wss.on('error', (error) => {
    console.error(`server-side websocket error: ${error}`);
});

// gracefully shut down the server on interrupt signal (Ctrl+C)
process.on('SIGINT', () => {
    console.log('shutting down server...');
    wss.close(() => {
        console.log('server closed');
        process.exit(0);
    });
});
```
### Testing
``` bash
npm i ts-node 
ts-node main.ts
npm i -g wscat
wscat -c ws://localhost:8080 # connect
# welcome to the websocket server!
hello
# echo: hello

# on server:
# websocket server is listening on port 8080
# client connected
# received: hello
# client disconnected
```
