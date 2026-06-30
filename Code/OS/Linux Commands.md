### Files
``` bash
ls # -A show hidden -l show perms -l
cat
cd
cp # -r recurse
rm # -r recurse, -f force
mv
touch
mkdir /parent/new-folder # -p create parents 
pwd # print working dir
install file /folder/ # cp -d create dir (like mkdir -p) -o owner -g group -m perms

du # dir size, -h human readable, -s total + folder, -c total, 
   # -a all (dirs+files), -x skip other fs dirs
df / # disk usage, -h human readable, -a all

# compression
tar -czvf archive.tar.gz folder/ # -cvf create (uncompressed), -xvf extract .tar, -czvf gzip, -xzvf extract .tar.gz -O stdout
gzip file.txt # compress to file.txt.gz -d decompress
gunzip file.txt.gz # decompress to file.txt
bzip2 file # stronger compression, outputs file.bz2
bunzip2 file.bz2 # decompress file
7z x archive.zip # `a` create archive
```
### Find
``` bash
grep # -r recurse, -i case-insensitive, -v invert, -a treat binary file as text, -n show line numbers
find -name *.txt -type f -size +10M # -iname case-insensitive -size +10M  > 10Mib; -10M < 10Mib
# remove .desktop apps containing 'fl'
find ~/.local/share/applications /usr/share/applications -iname '*fl*.desktop' -exec rm -i {} \;
find . -mtime -1 -maxdepth 1 -perm -x # -mtime modified time (days), -perm executable
find . -name "*.log" -exec du -h {} \; # list log file sizes one-by-one: du 1.log && du 2.log
find . -name "*.log" -exec du -h {} +; # list log file sizes batched: du 1.log 2.log
```
### Print
``` bash
# extract / format
awk -F',' '{ print $1, "has salary", $4 }' employee.txt # print 1st and 4th comma separated item for each line
awk -f command.awk # cat command.awk => {print} 
awk -v msg="hey" 'BEGIN {print msg}'# define variable
strings file # print readable text from binary -n 6 (> 6 chars)

# encoding
echo "hello" | base64 # -d decode
echo "abc" | tr 'a-z' 'A-Z' # replace abc => ABC -d delete
xxd file > hex.txt # binary => hex dump -r hex dump => binary -p hex only -s,-l range start/end -c bytes per line

# sort / deduplicate
du / | sort file.txt # default ascii sort -r reverse, -n numeric, -u unique, -k column (space separated), -t separator
du / | uniq # remove consecutive duplicates lines, use 'sort | uniq' to remove all duplicates -c count dupes, -d show dupes only, -u show uniques only, -i ignore case
du / | awk '!seen[$0]++' file.txt # remove all duplicates while preserving original order

# filter
head -n 20 -c 100 # first 20 lines or 100 chars
tail -n 20 -c 100 #  last 20 lines or 100 chars

history # history of executed commands
```
### Process
``` bash
ps # -e/A all procs, -r running only, aux all procs with info
kill # -9 force
killall # kill all procs
watch -n 1 ls # ls every 1s
sudo fuser -k 11434/tcp # kill process occupying port

systemctl list-units --type=service --state=running
```
### User Permissions
``` bash
sudo -u <user> google-chrome # run as user
su <username> # switch user
useradd -m newuser
passwd newuser
chmod # +x, -x, =x add/rm/set exec perm, -R recurse
      # 1=e 2=w 4=r 7=rwx, 777=rwx for owner|group|others
      # u=rw g=r o=r | u=owner, g=group, o=others
chown # change owner, -R recurse
umask 022 # remove default permissions, removes write permission from group/others when creating a new file/dir with default perms 
```
### [[Linux Network]]
### [[Linux Tips]]
### [[Bash]]
### Profiling
``` bash
top/htop/nvtop/atop
perf cpu/clocks/memory/cache
gprof functions
valgrind cache/memory
strace trace sys calls
ltrace trace lib calls
bpftrace
flamegraph
```
