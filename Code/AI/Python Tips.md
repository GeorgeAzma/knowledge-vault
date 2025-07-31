### File Operations
``` python
import os
for file in os.listdir("folder/"):
    if file.lower().ends_with(".txt"):
        os.remove(os.path.join("folder/", file))
```
### Call Commands
``` python
import subprocess
try:
    subprocess.run(["curl", "-o", save_path, url], check=True)
except subprocess.CalledProcessError as e:
    print(f"Error downloading file: {e}")
    return False
```
