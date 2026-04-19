network level blocker using raspberry pi as [[DNS|DNS]] server
``` bash
# set static IP for Pi, modify router DNS settings as well
nmcli con show
nmcli con mod "Floor 2" ipv4.addresses 192.168.100.2/24
nmcli con mod "Floor 2" ipv4.gateway 192.168.100.1
nmcli con mod "Floor 2" ipv4.dns "1.1.1.1 8.8.8.8"
nmcli con mod "Floor 2" ipv4.method manual
nmcli con up "Floor 2"

sudo apt install lighttpd # might be necessary
curl -sSL https://install.pi-hole.net | bash

# open http://192.168.100.2/admin for admin panel

systemctl status pihole-FTL
```
### Use Pi-Hole on Windows
``` powershell
# set DNS server to Pi-Hole
netsh interface ip set dns name="Wi-Fi" static 192.168.100.2 primary
netsh interface ip add dns name="Wi-Fi" 1.1.1.1 index=2

# flush state
netsh interface ip set dns name="Wi-Fi" dhcp  
netsh interface ip set dns name="Wi-Fi" static 192.168.100.2
ipconfig /flushdns
ipconfig /renew
```
