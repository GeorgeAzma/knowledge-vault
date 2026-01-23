``` bash
##### Drive Partition #####
lsblk
cfdisk /dev/nvme1n1 # 1G EFI, 16G swap, Linux FS
mkfs.fat -F32 /dev/nvme1n1p1
mkswap /dev/nvme1n1p2
mkfs.ext4 /dev/nvme1n1p3
mount /dev/nvme1n1p3 /mnt
mount /dev/nvme1n1p1 /mnt/boot
swapon /dev/nvme1n1p2

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt > /mnt/etc/fstab
arch-chroot /mnt

##### Time / Locale #####
ln -sf /usr/share/zoneinfo/Asia/Tbilisi /etc/localtime
hwclock --systohc
nano /etc/locale.gen # uncomment en_US.UTF-8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo your_hostname > /etc/hostname
passwd

##### Bootloader #####
bootctl install # mig--path=/boot
blkid -s UUID -o value /dev/nvme1n1p3 > /boot/loader/entries/arch.conf
nano /boot/loader/entries/arch.conf
"""
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options root=UUID=<piped-uuid> rw
"""
nano /boot/loader/loader.conf
"""
default arch.conf
timeout 0
editor 0
"""
exit
umount -R /mnt
reboot # change BIOS to boot linux drive

### Login ###
"""
<hostname> login: root
password: <password>
"""
useradd -m -G wheel <username>
passwd <username>
EDITOR=nano visudo
# %wheel ALL=(ALL:ALL) ALL # uncomment this

echo "nameserver 1.1.1.1" > /etc/resolv.conf
ping archlinux.org # should work

sudo pacman -S nvidia nvidia-utils hyprland wayland \
    wlroots xdg-desktop-portal-hyprland alacritty tmux \
    sddm wget git base-devel networkmanager
# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

sudo yay -S google-chrome nwg-look neofetch
systemctl enable sddm

sudo pacman -S swaync htop hyprpaper wofi waybar \
    cliphist wl-clipboard vulkan-icd-loader \
    pipewire wireplumber pipewire-pulse \
    playerctl pavucontrol ranger obsidian spotify
```
### Reinstalling
``` bash
### On Host Machine ###
pacman -Qqe > pkglist.txt # list all explicitely installed packages
pacman -Qqm > aurlist.txt # list all non-official packages
rsync -av --exclude={'google-chrome','Code','Code - OSS','obsidian'} ~/.config/ /target/.config/
rsync -av --exclude={'Steam','Trash'} ~/.local/share/ /target/.local/share/
cp /usr/local/share/. /target/usr/local/share/
cp /usr/local/bin/. /target/usr/local/bin/
cp ~/.local/bin/. /target/.local/bin/
cp ~/.bashrc /target/.bashrc

### On Target Machine ###
pacman -S --needed - < pkglist.txt
yay -S --needed - < aurlist.txt
```
### Booting From Windows
``` powershell
bcedit /enum firmware
bcdedit /set {fwbootmgr} bootsequence {a23a8c68-4de2-11f0-b328-806e6f6e6963}
shutdown /r /t 0
```
