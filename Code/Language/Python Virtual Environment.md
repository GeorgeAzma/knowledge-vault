---
aliases:
  - venv
  - uv
---
### venv
``` bash
python -m venv .env
.venv/scripts/activate
# install dependencies... and then
pip freeze > requirements.txt

# later install requirements with
pip install -r requirements.txt
```
### uv
``` bash
# Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
# Windows
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
# Pip
pip install uv

uv python list
uv python install # latest
uv python install 3.12
uv python uninstall 3.12
uv python pin 3.12 # pin project to python version
uv python find 3.12

uv init # create project in current dir
uv init myproject # create project in new folder
uv init --app
uv init --lib
uv init --package
uv init --python 3.12
uv init --script script.py numpy # standalone script (with dependency)

uv add "numpy>=2.0" pandas
uv add --dev pytest ruff
uv pip install torch --torch-backend=auto # uses CUDA, or via env var UV_TORCH_BACKEND=cu130
uv remove numpy
uv sync # install/update requirements in current environment
uv lock # update lockfile
uv lock --upgrade # upgrade all deps
uv tree # dependency tree

uvx ruff check . # temporary tool

uv tool list # global tools
uv tool install ruff
uv tool uninstall ruff
uv tool upgrade ruff
uv tool upgrade --all

uv run python # python interpreter
uv run main.py
uv run pytest
uv run python script.py
uv run --with numpy script.py # temporary package

uv venv
uv venv --python 3.12

uv build
uv publish

uv cache clean
uv cache prune
uv cache dir

uv version
uv self update
```