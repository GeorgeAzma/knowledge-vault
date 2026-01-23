### Setup
``` bash
# project/
uv init
uv tool install workers-py
uv run pywrangler init
```
### Run
``` bash
cd worker-name/
uv pywrangler run dev
```
### Deploy
``` bash
uv pywrangler run deploy
```