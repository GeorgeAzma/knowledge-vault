- https://claude.ai/share/d1e8e6f8-c97c-453b-aa15-ab6d5f7d2b6c
- [[SSH]]
- [[WGet]]
- [[DNS]]
``` bash
wget example.com/file.txt # -O save as -r recurse -c resume interrupted download --limit-rate=500k
curl -X POST -d "name=foo" example.com/api # -O download file
curl ifconfig.me # get public ip address

ss -tulnp # -t tcp -u udp -l listening -n use numeric ports (ssh => 22) -p show processes
netstat -tulnp # list listening ports with PID
netstat -rn # show routing table
sudo tcpdump -i eth0 # capture on interface
nmap -sn 192.168.100.0/24 # scan hosts
hostname -I # get active ipv4
lsof -i :1234 # -i search by ip:port

dig +short google.com # DNS IP Address lookup
nslookup google.com 1.1.1.1 # DNS IP Address lookup via Domain Server

nc -lp 9000 # listen port (via netcat)
nc 192.168.1.5 9000 < file.txt # send file contents

socat TCP-LISTEN:11434,fork,reuseaddr TCP:127.0.0.1:11434 # expose 127.0.0.1:11434 => 0.0.0.0:11434

nmcli con down "Floor 2"
nmcli con up "Floor 2"
nmcli con mod "Floor 2" \
  ipv4.addresses 192.168.1.100/24 \
  ipv4.gateway 192.168.1.1 \
  ipv4.dns "1.1.1.1 8.8.8.8" \
  ipv4.method manual # static ip
  
nmcli dev show wlan0 | grep DNS
```