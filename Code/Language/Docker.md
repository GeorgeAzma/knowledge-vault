### Terms
- **Container**: Application package with everything it needs (assets, code etc.)
- **Image**: Set of instructions defined by `Dockerfile` that builds/executes code inside a docker container, like a template 
### Commands
- `docker run` Create a new docker container from an image
- `docker compose` Launch containers using `compose.yaml` file

`.dockerignore`: Contains stuff to ignore when copying code to a container
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

> [!example] `.dockerignore`
> ``` r
> **/.classpath
> **/.dockerignore
> **/.env
> **/.git
> **/.gitignore
> **/.project
> **/.settings
> **/.toolstarget
> **/.vs
> **/.vscode
> **/.next
> **/.cache
> **/*.*proj.user
> **/*.dbmdl
> **/*.jfm
> **/charts
> **/docker-compose*
> **/compose*
> **/Dockerfile*
> **/node_modules
> **/npm-debug.log
> **/obj
> **/secrets.dev.yaml
> **/values.dev.yaml
> **/build
> **/dist
> LICENSE
> README.md
> ```

You can also define .env file for things like API Keys:
`.env`: `API_KEY=<key>`
