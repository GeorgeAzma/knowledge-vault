---
aliases:
  - Samba
---

``` bash
sudo apt install samba

sudo smbpasswd -a my_user
```
`/etc/samba/smb.conf`
``` toml
[my_shared_folder]
path = /home/my_user/my_shared_folder
browseable = yes
read only = no
guest ok = no
```
``` bash
sudo systemctl restart smbd

# print samba configuration
testparm -s
sudo cat /etc/samba/smb.conf

# check active shared locations
sudo smbstatus
```
### Windows
