``` bash
# listing
lsblk # list disks /dev/nvme0n1p1
lsblk -o name,size,type,fstype,parttype,mountpoint # print specific fields
sudo fdisk -l
df -h # list mounted drives and size info
blkid # list partitions and their UUIDs
cat /mnt/etc/fstab # print persistently mounted drives

# partitioning
sudo cfdisk /dev/nvme1n1 # interactive disk partitioner
sudo fdisk /dev/nvme1n1 # n: new partition, d: delete, t: change type, w: save, q: quit, p: print table 
sudo parted /dev/nvme1n1 # better for large disks. mklabel gpt; mkpart primary ext4 0% 100%; quit

# formatting
sudo mkfs.ext4 /dev/nvme1n1p1
sudo mkswap /dev/nvme1n1p2 # create swap partition 

# mounting (temporary)
sudo mount /dev/nvme1n1p1 /mnt
sudo swapon /dev/nvme1n1p2 # turn swap partition on
sudo umount /mnt

# mounting (persistent)
genfstab -U /mnt > /etc/fstab # save currently mounted drives
sudo mount -a # mount all drives in fstab

mkfs.fat -F32 /dev/nvme1n1p1
```
### `/etc/fstab`
``` bash
UUID=abcd-1234 /mnt/data ext4 defaults,noatime 0 2
```
- **options**
    - `defaults` standard options `rw, suid, dev, exec, auto, nouser, async`
    - `noatime` reduces writes, better performance `no access time updates`
    - `rw` read/write
    - `ro` read-only
    - `nofail` do not fail boot if disk/partition is missing
    - `x-systemd.automount` only mount when `/mnt/data` is accesed (not on boot)
    - `x-systemd.device-timeout=1` give up if device is not ready in `1` second
- `0` = do not use dump backup `almost always 0`
- `2` = `fsck` priority
    - `fsck` ensures filesystem integrity after power outage, moves corrupted data to `lost+found`
    - `0` do not check filesystem at boot
    - `1` check first, reserved for root `/`
    - `2` check after root, used for all other partitions