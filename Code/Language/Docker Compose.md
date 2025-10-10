### Basic
``` yaml
services:
  db:
    image: postgres:13
    environment:
      API_KEY: my-key
    ports:
      - 80:81 # route host's 80 port to container's 81 port
    depends_on:
      - backend # don't build unless backend is built
    
    backend:
      build: 
        context: backend # build Dockerfile inside ./backend
        target: builder # build at stage 'builder'
```
### Volumes
``` yaml
volumes:
  shared-data:

services:
  container1:
    volumes:
      - shared-data:/shared

  container2:
    volumes:
      - shared-data:/shared

  container3:
    volumes:
      - ./local-file.txt:/etc/container-file.txt:ro
    volumes: # equivalent to above
      - type: bind
        source: ./local-file.txt
        target: /etc/container-file.txt
        read_only: true
```
### Networks
``` yaml
services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app: # app <-> proxy/db, no proxy <-> db
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend

networks:
  frontend:
    driver: bridge
    driver_opts:
      com.docker.network.bridge.host_binding_ipv4: "127.0.0.1"
  backend:
    driver: custom-driver
```
##### Network Drivers
- `bridge` for communication between containers
- `host` use same network as host machine
- `none` isolate container from network
- `overlay, ipvlan, macvlan`
