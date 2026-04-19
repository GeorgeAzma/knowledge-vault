``` bash
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl status ssh

ssh user@<ipv4>
ssh-keygen -t ed25519 # saved [public: ~/.ssh/id_ed25519.pub, private: ~/.ssh/id_ed25519]
ssh-copy-id user@<ipv4> # copy key, avoids passwords everytime
# or add edit ~/.ssh/id_ed25519.pub => user@<ipv4>:~/.ssh/authorized_keys

ssh -X user@<ipv4> # for forwarding GUI apps
ssh -YC user@<ipv4> # for trusted forwarding compressed GUI apps

ssh user@remote_host 'echo hi' # remote login, cmd exec

ssh -L 8080:localhost:11434 user@server.com # forward localhost:8080 => server's localhost:11434
ssh -R 8080:localhost:11434 user@server.com # forward server's localhost:8080 => localhost:11434

sshfs user@server.com:/remote/path /local/mount # mount remote dir
scp file.txt user@host:/home/user/ # secure remote file copy -r recurse

# faster transfer for directories -a archieve (preserve perms, time, symlink) 
# -v verbose (list files) -z (compressed *transfer*) -e remote shell command to use
rsync -avz -e "ssh -p 8022" --exclude={'a','b'} /mnt/c/data 192.168.100.x:home/user/
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

# ssh-copy-id equivalent:
type $env:USERPROFILE\.ssh\id_ed25519.pub | user@<ipv4> "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```
### Easy Alias
`~/.ssh/config`
``` python
Host pi
    Hostname 192.168.100.2
    User my-user
```
### Security
`.ssh/config`
```
PasswordAuthentication no 
PermitRootLogin no
```
##### Fail2Ban
watches for repeated failed auth attempts and temporarily bans IP
``` bash
sudo apt install fail2ban -y

sudo nano /etc/fail2ban/jail.local

[sshd]
enabled = true
port    = 2222
maxretry = 3
bantime  = 1h
findtime = 10m

sudo systemctl enable --now fail2ban
```
##### Tailscale
``` bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up

# download https://tailscale.com/download or from play store on phone
```