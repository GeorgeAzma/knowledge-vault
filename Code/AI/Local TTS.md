- `git clone github.com/GeorgeAzma/tts`
- install chatterbox tts `conds.pt, s3gen.pt, t3_cfg.pt, tokenizer.json, ve.pt`
- move them to `./chatterbox`
- place default voices inside `voices/elise.wav`
- `py server.py`
``` bash
curl localhost:5000/v1/audio/speech -H "Content-Type: application/json" -d "{\"input\":\"hello\"}" -o gen.mp3
```
> [!note] Needs `~6GB` VRAM and is `1-2x` realtime on `RTX 3080`
