``` powershell
{base-url}/{api-version}/{product}/{sub-product}
# base-url = test-api.tbcbank.ge = 
#            api.tbcbank.ge
# api-version = v1

# USD to GEL
GET /v1/exchange-rates/commercial/convert?amount=1&from=usd&to=gel HTTP/1.1
Host: api.tbcbank.ge
apikey: qWjGGo6UP5nxLWD2jZz9bvAzGBKugQGA
```
