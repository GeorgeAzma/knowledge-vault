### Apt
``` bash
# cleanup
sudo apt purge package_name # remove package/config
sudo apt autoremove # remove unused deps
sudo apt clean # clean download cache
```
### [[Arch Linux|Pacman]]
``` bash
# cleanup
sudo pacman -Rns package_name # remove package/deps/config
sudo pacman -Qdtq | sudo pacman -Rns - # remove orphaned packages
sudo pacman -Scc # clean package cache
sudo paccache -r # clean package cache, except latest ones
```
