``` bash
ssh user@<ipv-4>
ssh-keygen -t ed25519 # saved ~/.ssh/id_ed25519
```
### Windows
``` powershell
# install ssh server (run as admin)
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
# start ssh server
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
# allow ssh through firewall
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```
