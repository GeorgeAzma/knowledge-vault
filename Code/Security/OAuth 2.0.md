Allows apps to access user data without exposing their credentials, used for log-in
### Key Components
- **Resource Owner** user who owns data `me`
- **Client** app accessing user data `yt`
- **Authorization Server** auths user and issues access tokens `google -> `[[Json Web Token (JWT)|JWT]]
- **Resource Server** hosts user data `usually same as auth server`
- **Access Token** grants temp access to data on resource server
- **Refresh Token** used to obtain a new access token after old one expires
### Standard Authorization Code Flow
``` mermaid
sequenceDiagram
    App->>User: Redirect for Auth
    User->>Server: Auth and Grant Perms to App
    Server->>User: Auth Code
    User->>App: Auth Code
    App->>Server: Auth via Code + AppID + Secret --> /token
    Server->>App: Access Token (JWT)
    App->>Server: API call via Access Token
    Server->>App: Protected Resource
    App->>Server: Refresh Token
    Server->>App: New Access Token
```
### Pros
- `user` can grant/revoke permissions anytime
- `user` doesn't share passwords with `app`
- `app` receives auth code from `auth server` without `user` seeing it
  `so user can't make API calls like it's from the app`
  `or they won't accidentally leak the access token JWT`
- supports mutiple auth flows
### TBC Bank API Example
- create app which will give you
    - public key `client_id`
    - private key `secret`
- base64 encode `client_id:secret`
``` http
POST test-api.tbcbank.ge/oauth/token
Content-Type: application/x-www-form-urlencoded
Authorization: Basic <base64-encoded-auth>

grant_type=client_credentials&scope=online_installments
```
