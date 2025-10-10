``` bash
echo 'hi' > foo.txt # overwrite file
echo '\n' >>        # append file
echo < foo.txt      # input from file
cmd1 && cmd2  # if success(cmd1) { run cmd2 }
cmd1 || cmd2  # if failure(cmd1) { run cmd2 }
cmd & # run in background

(cd tmp && ls) # run cmds in subshell
{cd tmp; ls; } # group cmds in curr shell

Escape\ Space

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
