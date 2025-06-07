### Options
- `-O` change downloaded file's name
- `-c` continue even when interrupted
- `--limit-rate=20k` limit download speed `kilo-bytes`
- `-r` recursive download `dirs + subdirs`
- `-q` quiet, `-nv` less verbose
- `--show-progress`
- `--timeout`
- `--tries (default: 0, unlimited)`
- `--no-check-certificate`
- `--user-agent="Mozilla/5.0"`
``` bash
cd C:\Users\User\Downloads; wsl wget -c -O <output-file-name> --show-progress <url>
```