``` bash
# download file
wget -c -O ~/output.txt --show-progress https://example.com/example.txt

# mirror
wget -r -np -nH --cut-dirs=1 https://example.com/files

-O # change downloaded file's name
-c # continue even when interrupted
--limit-rate=20k # limit download speed `kilo-bytes`
-r # recursive download `dirs + subdirs`
-q # quiet, `-nv` less verbose
--show-progress
--timeout
--tries # default: 0, unlimited
--no-check-certificate
--user-agent="Mozilla/5.0"
-np # do not climb to parent dir
--cut-dirs=2 # https://example.com/models/checkpoints/model.safetensors => checkpoints/model.safetensors
```
