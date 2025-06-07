
| Command |               Description               |                                     Flags                                      |                                                          Example Args                                                          |
| :-----: | :-------------------------------------: | :----------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------: |
|  `ls`   |               list files                |                                                                                |                                                                                                                                |
|  `cat`  |               print file                |                                                                                |                                                           `file.txt`                                                           |
|  `cd`   |                goto dir                 |                                                                                |                                                 `"spaced dir" "./-dashed dir"`                                                 |
|  `pwd`  |            print working dir            |                                                                                |                                                                                                                                |
|  `cp`   |              copy file/dir              |                                  `-r` recurse                                  |                                                                                                                                |
|  `mv`   |              move file/dir              |                                                                                |                                                                                                                                |
|  `rm`   |               rm file/dir               |                            `-r` recurse `-f` force                             |                                                                                                                                |
| `echo`  |                  print                  |                                                                                |                                                        `'hi' > foo.txt`                                                        |
| `touch` |               create file               |                                                                                |                                                           `foo.txt`                                                            |
| `wget`  |              web download               |                                  `-r` recurse                                  |                                                       `foo.com/file.txt`                                                       |
| `curl`  |            get/post web data            |                               `-O` download file                               |                                              `-X POST -d "name=foo" foo.com/api`                                               |
|  `ssh`  | securely connect to <br>remote machines |                                                                                |                                        `user@remote_host`<br>remote login and cmd exec                                         |
|  `scp`  |         secure remote file copy         |                                                                                |                               `file.txt user@host:/path/dir`<br>`user@host:/path/file.txt ./dir`                               |
| `grep`  |          find pattern in files          |                                  `-r` recurse                                  |                                                        `"pat" file.txt`                                                        |
| `find`  |            find file in dir             |                  `-name *.txt` <br>`-type f`<br>`-size +10M`                   |                                                                                                                                |
|  `ps`   |               list procs                |                                                                                |                                                      `ps aux` or `ps -ef`                                                      |
| `kill`  |                kill proc                |                                   `-9` force                                   |                                                                                                                                |
| `chmod` |            change file perms            | `+x` add exec perm<br>`-x` rem exec perm<br>`=x` set exec perm<br>`-R` recurse | `4 read \| 2 write \| 1 exec, 7 = +rwx`<br>`777 = +rwx for owner\|group\|others`<br>`u=rw,g=r,o=r \| u=owner,g=group,o=others` |
| `chown` |              change owner               |                                  `-R` recurse                                  |                                                                                                                                |
|  `df`   |               disk usage                |                    `-h` human readable<br>`-i` inode usage                     |                                                                                                                                |
|  `du`   |            estimate dir size            |                           `-sh` total `-h` detailed                            |                                                                                                                                |
|  `tar`  |                compress                 |                `-cvf` create<br>`-xvf` extract<br>`-czvf` gzip                 |                                                                                                                                |
| `watch` |                                         |                              `-n 1` every second                               |                                                       `ls` or `-n 1 df`                                                        |
### Operators
``` bash
echo 'hi' > foo.txt # overwrites
echo '\n' >>        # appends
echo < foo.txt      # input from file
cmd1 && cmd2  # if success(cmd1) { run cmd2 }
cmd1 || cmd2  # if failure(cmd1) { run cmd2 }
cmd & # run in background

(cd tmp && ls) # run cmds in subshell
{cd tmp; ls; } # group cmds in curr shell

curr_date=$(date)
echo "Today is $curr_date"

if [-f "foo.txt" ]; then
    echo "foo.txt exists"
else 
    echo "no foo.txt"
fi

for i in 1 2 3; do
    echo "num $i"
done

while [ cond ]; do
    echo "loop"
done

until [ cond ]; do
    echo "loop"
done

case "$1" in
    start)
        echo "Starting"
        ;;
    stop)
        echo "Stopping"
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        ;;
esac
```
### Profiling
- `perf` cpu/clocks/memory/cache
- `gprof` functions
- `valgrind` cache/memory
- `strace` trace sys calls
- `ltrace` trace lib calls
- `htop/atop/top` task manager
- `bpftrace`
- `flamegraph`
### User
``` bash
# create user
useradd -m newuser
passwd newuser

su <username> # switch user

sudo -u <user> google-chrome # run as user
```
