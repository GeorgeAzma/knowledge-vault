[[Docker Compose]]
### Terms
- **Container** Application package with everything it needs `assets, code etc.`
- **Image** Set of instructions defined by `Dockerfile` that builds/execs code inside a docker container, like a template 
### Commands
- `docker run` Create a new docker container from an image
- `docker compose` Launch containers using `docker-compose.yaml` file
- `docker system df -v` Storage usage info
- `docker exec -ai <container>` Open terminal inside stopped container
- `docker exec -it <container> bash` Open terminal inside running container
- `docker run -it --entrypoint bash <image>` Open terminal inside non-running image

`.dockerignore` contains stuff to ignore when copying code to a container
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

> [!example] `Dockerfile`
> ``` Dockerfile
> FROM node:slim as build
> WORKDIR /server
> 
> COPY . .
> RUN npm ci --quiet && npm run build
> 
> FROM node:slim
> ENV NODE_ENV production
> COPY package*.json .
> RUN npm ci --quiet --omit=dev
> COPY --from=build ./server/dist .
> EXPOSE 8000
> CMD ["node", "server.js"]
> ```
- `.env` file with env vars like `API_KEY=<key>`
