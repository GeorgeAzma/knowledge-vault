### Install
``` bash
curl -sSL https://get.docker.com | sh
sudo systemctl enable --now docker

sudo usermod -aG docker $USER # avoids sudo by adding $USER to docker group (optional)
newgrp docker # update group membership (optional)
```
### Terms
- **Container** Application package with everything it needs `assets, code etc.`
- **Image** Set of instructions defined by `Dockerfile` that builds/execs code inside a docker container, like a template 
### Commands
``` bash
docker run # create a new docker container from an image
docker compose # launch containers using `docker-compose.yaml` file
docker system df -v # storage usage info
docker exec -ai <container> # open terminal inside stopped container
docker exec -it <container> bash # open terminal inside running container
docker run -it --entrypoint bash <image> # open terminal inside non-running image
```
### [[Docker Compose]]
> [!example] `compose.yaml`
> ``` r
> services:
>   chatbot-client:
>     build: ./client
>     ports:
>       - 3000:80
>     depends_on:
>       - chatbot-server
> 
>   chatbot-server:
>     build: ./server
>     ports:
>       - 8000:8000
> 
>     env_file:
>       - .env
> ```
### Dockerfile
``` Dockerfile
FROM node:slim as build
WORKDIR /server

COPY . .
RUN npm ci --quiet && npm run build

FROM node:slim
ENV NODE_ENV production
COPY package*.json .
RUN npm ci --quiet --omit=dev
COPY --from=build ./server/dist .
EXPOSE 8000
CMD ["node", "server.js"]
```

- `.dockerignore` contains stuff to ignore when copying code to a container
- `.env` file with env vars like `API_KEY=<key>`
##### `/etc/docker/daemon.json`
``` json
{
    "dns": ["1.1.1.1"], // avoid tailscale issues
    "registry-mirrors": [ 
        "https://mirror.gcr.io", // google's mirror, can be more reliable in Georgia
        "https://dockerhub.azk8s.cn" 
    ]
}
```
