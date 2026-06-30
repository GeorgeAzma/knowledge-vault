https://docs.krita.org/en/user_manual/python_scripting/krita_python_plugin_howto.html

1. go to `%APPDATA%\krita\pykrita`
2. add `myplugin/` folder
3. add `myplugin.desktop` file
4. add `C:\Program Files\Krita (x64)\lib\krita-python-libs\PyKrita` 
       to `Python > Analysis > Extra Paths` for syntax higlighting
### Directory Structure
```
%APPDATA%/krita/pykrita/
├─ my-plugin.desktop
└─ my-plugin/
   ├─ __init__.py
   ├─ my-plugin.py # optional
   └─ manual.html # optional
```
##### `my-plugin.desktop`
`name does not matter, *.desktop works`
``` toml
[Desktop Entry]
Type=Service
ServiceTypes=Krita/PythonPlugin
X-KDE-Library=my-plugin # must match folder name
X-Python-2-Compatible=False
X-Krita-Manual=manual.html
Name=My Krita Plugin
Comment=My first plugin
```
##### `__init__.py`
``` python
from .my_plugin import *
```
##### `my-plugin.py`
``` python
from krita import *

# runs on krita start
class MyExtension(Extension):
    def __init__(self, parent):
        super().__init__(parent)

    def setup(self):
        pass

    # add actions to 'Tools' menu
    def createActions(self, window):  
        action = window.createAction("myAction", "My Script", "tools/scripts")


Krita.instance().addExtension(MyExtension(Krita.instance()))
```
