[[Arch Linux]]
[[Linux Commands]]
[[Windows Subsystem for Linux (WSL)]]
### Directories
``` bash
/                  # root
/bin               # user binaries
/sbin              # system binaries (admin commands)
/usr               # user programs and data
/usr/bin           # non-essential user binaries (apps)
/usr/sbin          # non-essential system binaries
/usr/local         # locally installed software and scripts
/usr/share         # architecture-independent data (docs, icons)
/etc               # system config files
/var               # variable data (logs, spool, cache, mail)
/home              # user home directories
/root              # home directory for root user
/tmp               # temp files (cleared on reboot, typically stored in ram-disk)
/var/tmp           # temp files (less often cleared)
/dev               # device files (hardware interfaces)
/proc              # virtual filesystem for process and kernel info
/sys               # virtual filesystem for kernel and devices
/run               # runtime variable data (PID files, sockets)
/lib               # shared libs and kernel modules
/lib/modules       # kernel modules directory
/media             # mount point for removable media (USB, CDs)
/mnt               # temp mount point for filesystems
/boot              # boot loader files
```
### User Directories
``` bash
~/.bashrc          # bash script which is ran before terminal opens       
~/.bash_profile    # bash script which is ran at login
~/.config          # user config
~/.local/share     # architecture-independent user data (docs, icons)
~/.cache           # temporary cached data
```
