``` bash
### FILES ###
ls
cat
cd
cp # -r recurse
rm # -r recurse, -f force
mv
touch
du # dir size, -h human readable, -s total + folder, -c total, 
   # -a all (dirs+files), -x skip other fs dirs
df # disk usage, -h human readable, -a all
tar -czvf archive.tar.gz folder/ # -cvf create (uncompressed), -xvf extract, -czvf gzip
gzip file.txt # compress to file.txt.gz
gunzip file.txt.gz # decompress to file.txt
7z x archive.zip # `a` create archive
pwd # print working dir

### FIND ###
find
grep

### LINUX ###
ps # -e/A all procs, -r running only, aux all procs with info
kill # -9 force
killall # kill all procs
watch -n 1 ls # ls every 1s

### USER/PERMS ###
sudo -u <user> google-chrome # run as user
su <username> # switch user
useradd -m newuser
passwd newuser
chmod # +x, -x, =x add/rm/set exec perm, -R recurse
      # 1=e 2=w 4=r 7=rwx, 777=rwx for owner|group|others
      # u=rw g=r o=r | u=owner, g=group, o=others
chown # change owner, -R recurse


### NET ###
wget example.com/file.txt # -r recurse
curl -X POST -d "name=foo" example.com/api # -O download file
ssh user@remote_host # remote login, cmd exec
scp file.txt user@host:/path/dir user@host:/path/file.txt ./dir # secure remote file copy
grep # -r recurse, -i case-insensitive
find -name *.txt -type f -size +10M # -iname case-insensitive

### PROFILING ###
top/htop/nvtop/atop
perf cpu/clocks/memory/cache
gprof functions
valgrind cache/memory
strace trace sys calls
ltrace trace lib calls
bpftrace
flamegraph
```
### [[Bash]]
### Tips
``` bash
# remove .desktop apps containing 'fl'
find ~/.local/share/applications /usr/share/applications -iname '*fl*.desktop' -exec rm -i {} \;
```
