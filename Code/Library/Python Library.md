### Directory Structure
```
my-lib/
├─ pyproject.toml
├─ README.md
├─ LICENSE
├─ .gitignore
├─ src/
│  └─ my-lib/ # can be different from package name
|     ├─ __init__.py  
│     ├─ math.py
│     └─ utils.py
└─ tests/
   └─ test_math.py 
```
### `pyproject.toml`
``` toml
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[project]
name = "my-library"
version = "0.1.0"
description = "My library"
readme = "README.md"
license = "MIT"
authors = [
  { name = "Your Name" }
]
requires-python = ">=3.10"

dependencies = []

[project.urls]
Homepage = "https://github.com/yourname/my-lib"

#----- Optional Stuff -----#
[project.optional-dependencies]  
dev = [  
    "pytest",  
    "ruff",  
] # pip install my-lib[dev]

[project.scripts]  
my-tool = "my-lib.cli:main" # > mytool "my args, mytool installed into PATH"
```

``` bash
# setup
pip install build # creates wheel/sdist 
pip install twine # uploads to PyPI

# build
python -m build # creates dist/my-lib-0.1.0.tar.gz and dist/my-lib-0.1.0-py3-none-any.whl

# install locally
pip install dist/my-lib-0.1.0-py3-none-any.whl # install wheel

# publish to PyPI or TestPyPI 
# create account: https://pypi.org/account/register | https://test.pypi.org/account/register
twine upload --repository testpypi dist/* # upload to TestPyPI
# auth with username and api token from: 
# https://pypi.org/account/login/?next=%2Fmanage%2Faccount%2Ftoken%2F%3F
twine upload dist/* # upload to real PyPI, auth with username and api token

# install from PyPI
pip install my-lib # or my_lib, my.lib, MY-LIB. 

# import my_lib
```
### Wheels
faster to import than python source. `.whl` is just a zip archive with
```
my-lib/
├─ __init__.py  
├─ core.py
└─ my-lib-0.1.0.dist-info/
   ├─ METADATA
   ├─ WHEEL
   └─ RECORD
```
### Sdist
zipped source distribution (via `.tar.gz`), pip unzips it and builds/installs wheel locally
