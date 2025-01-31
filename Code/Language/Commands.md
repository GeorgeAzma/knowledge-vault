---
aliases:
  - Power Shell
  - Command Prompt
---
### Command Prompt `Windows`
- `taskkill /IM task.exe`
##### Files
- `cd.>file.txt` create file
- `dir` list files
    - `/B` list only file names
- `type file.txt` print file
##### Network
- `netstat` display [[Network]] connections `-an for active connections` 
- `netsh wlan show profile` show all Wi-Fi names you have ever connected to
- `netsh wlan show profile "WifiName" key=clear` Wi-Fi password
- `tracert google.com` trace route that your request took to get to `google.com`
- `nslookup google.com` see local [[Domain Name System (DNS)|DNS]] info
### Power Shell
- `Stop-Process -Name task.exe`
##### Files
- `cd >file.txt`
