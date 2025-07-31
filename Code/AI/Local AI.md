### Setup AIs
- [[Local LLM Inference]]
- [[Local Image Generation]]
- [[Local TTS]]
### Connect OWUI To ComfyUI
open `admin panel > settings > images`
- turn on image generation
- set comfyUI base url to `127.0.0.1:8188`
- export desired workflow as API `developer settings must be on`
- load that json as ComfyUI workflow
- see which node_id holds prompt, which holds checkpoint name etc
  and assign these node_ids to corresponding fields
- set default model to `waiNSFWIllustrious_v130.safetensors`
- set image generation size to `1024x1024 (~1 megapixel works best)`
- set steps to `20-40`
> [!tip] 
> by default open-webui hosts on `0.0.0.0:8080` 
> meaning phones on same network also have access
> access by going to `<pc-ipv4>:8080`
### Host OWUI
- [[Tunnel Localhost To Domain via Cloudflare]]
- write script that does everything for you
``` bash
###### ai.bat ######
@echo off
powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0ai.ps1"

###### ai.ps1 ######
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class CtrlC {
  public delegate bool Handler(int type);
  [DllImport("Kernel32")] public static extern bool SetConsoleCtrlHandler(Handler h, bool add);
}
"@

$procs = @()

# Define Ctrl+C handler
$handler = [CtrlC+Handler]{
    Write-Host "`nStopping services..."
    $procs | ForEach-Object {
        if (-not $_.HasExited) { Stop-Process $_.Id -Force }
    }
    exit
}
[CtrlC]::SetConsoleCtrlHandler($handler, $true) | Out-Null

# Services to run
$commands = @(
    @("open-webui", "serve --host 0.0.0.0 --port 8080"),
    @("ollama", "serve"),
    @("comfy", "launch -- --lowvram --disable-smart-memory --preview-size 256 --fast"),
    @("cloudflared", "tunnel run --protocol http2 lumiey")
)

# Start each
foreach ($cmd in $commands) {
    $procs += Start-Process -FilePath $cmd[0] -ArgumentList $cmd[1] -PassThru -NoNewWindow
}

Write-Host "All services started. Press Ctrl+C to stop."

while ($true) { Start-Sleep 1 }
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class CtrlC {
  public delegate bool Handler(int type);
  [DllImport("Kernel32")] public static extern bool SetConsoleCtrlHandler(Handler h, bool add);
}
"@

$procs = @()

# Define Ctrl+C handler
$handler = [CtrlC+Handler]{
    Write-Host "`nStopping services..."
    $procs | ForEach-Object {
        if (-not $_.HasExited) { Stop-Process $_.Id -Force }
    }
    exit
}
[CtrlC]::SetConsoleCtrlHandler($handler, $true) | Out-Null

# Services to run
$commands = @(
    @("open-webui", "serve --host 0.0.0.0 --port 8080"),
    @("ollama", "serve"),
    @("comfy", "launch -- --lowvram --disable-smart-memory --preview-method taesd --fast"),
    @("cloudflared", "tunnel run --protocol http2 lumiey")
)

# Start each
foreach ($cmd in $commands) {
    $procs += Start-Process -FilePath $cmd[0] -ArgumentList $cmd[1] -PassThru -NoNewWindow
}

Write-Host "All services started. Press Ctrl+C to stop."

while ($true) { Start-Sleep 1 }
```
- or free temporary subdomain
    - `npm install -g localtunnel` 
    - `start /B lt -p 8080 -s lumi`
    - hosts at `lumi.loca.lt`
- `might not need --protocol http2`
### Connect OWUI To [[Local TTS]]
- `admin panel > settings > audio`
- `TTS engine: OpenAI`
- `API Base URL: http://localhost:5000/v1`
- `API Key: unused (0)`
- `TTS Voice: elise`
- `TTS Model: unused (chatterbox)`
### API Workflow JSONs

|  Node  |    Name     | ID  |
| :----: | :---------: | :-: |
| Prompt |   `text`    |  6  |
| Model  | `ckpt_name` |  4  |
| Width  |   `width`   |  5  |
| Height |  `height`   |  5  |
| Steps  |   `steps`   |  3  |
|  Seed  |   `seed`    |  3  |

##### WaiNSFW-Gen
``` json
{
  "3": {
    "inputs": {
      "seed": 547243789788866,
      "steps": 20,
      "cfg": 6,
      "sampler_name": "euler",
      "scheduler": "normal",
      "denoise": 1,
      "model": [
        "4",
        0
      ],
      "positive": [
        "6",
        0
      ],
      "negative": [
        "7",
        0
      ],
      "latent_image": [
        "5",
        0
      ]
    },
    "class_type": "KSampler",
    "_meta": {
      "title": "KSampler"
    }
  },
  "4": {
    "inputs": {
      "ckpt_name": "wai_v13.safetensors"
    },
    "class_type": "CheckpointLoaderSimple",
    "_meta": {
      "title": "Load Checkpoint"
    }
  },
  "5": {
    "inputs": {
      "width": 1024,
      "height": 1024,
      "batch_size": 1
    },
    "class_type": "EmptyLatentImage",
    "_meta": {
      "title": "Empty Latent Image"
    }
  },
  "6": {
    "inputs": {
      "text": "cute girl",
      "clip": [
        "4",
        1
      ]
    },
    "class_type": "CLIPTextEncode",
    "_meta": {
      "title": "CLIP Text Encode (Prompt)"
    }
  },
  "7": {
    "inputs": {
      "text": "sketch, bad quality, worst quality, bad anatomy",
      "clip": [
        "4",
        1
      ]
    },
    "class_type": "CLIPTextEncode",
    "_meta": {
      "title": "CLIP Text Encode (Prompt)"
    }
  },
  "8": {
    "inputs": {
      "samples": [
        "3",
        0
      ],
      "vae": [
        "4",
        2
      ]
    },
    "class_type": "VAEDecode",
    "_meta": {
      "title": "VAE Decode"
    }
  },
  "10": {
    "inputs": {
      "images": [
        "8",
        0
      ]
    },
    "class_type": "PreviewImage",
    "_meta": {
      "title": "Preview Image"
    }
  }
}
```
##### Hassaku-Gen
``` json
{
  "3": {
    "inputs": {
      "seed": 547243789788866,
      "steps": 30,
      "cfg": 6,
      "sampler_name": "euler",
      "scheduler": "normal",
      "denoise": 1,
      "model": [
        "4",
        0
      ],
      "positive": [
        "6",
        0
      ],
      "negative": [
        "7",
        0
      ],
      "latent_image": [
        "5",
        0
      ]
    },
    "class_type": "KSampler",
    "_meta": {
      "title": "KSampler"
    }
  },
  "4": {
    "inputs": {
      "ckpt_name": "hassaku_v22.safetensors"
    },
    "class_type": "CheckpointLoaderSimple",
    "_meta": {
      "title": "Load Checkpoint"
    }
  },
  "5": {
    "inputs": {
      "width": 1024,
      "height": 1024,
      "batch_size": 1
    },
    "class_type": "EmptyLatentImage",
    "_meta": {
      "title": "Empty Latent Image"
    }
  },
  "6": {
    "inputs": {
      "text": "cute girl",
      "clip": [
        "4",
        1
      ]
    },
    "class_type": "CLIPTextEncode",
    "_meta": {
      "title": "CLIP Text Encode (Prompt)"
    }
  },
  "7": {
    "inputs": {
      "text": "sketch, bad quality, worst quality, bad anatomy",
      "clip": [
        "4",
        1
      ]
    },
    "class_type": "CLIPTextEncode",
    "_meta": {
      "title": "CLIP Text Encode (Prompt)"
    }
  },
  "8": {
    "inputs": {
      "samples": [
        "3",
        0
      ],
      "vae": [
        "4",
        2
      ]
    },
    "class_type": "VAEDecode",
    "_meta": {
      "title": "VAE Decode"
    }
  },
  "10": {
    "inputs": {
      "images": [
        "8",
        0
      ]
    },
    "class_type": "PreviewImage",
    "_meta": {
      "title": "Preview Image"
    }
  }
}
```
### Docker
- add root directory
- add folders `cloudflare, comfyui, ollama, open-webui`
- copy settings and data into those folders
- add `docker-compose.yml` 
``` yaml
services:
  ollama:
    container_name: ollama
    image: ollama/ollama:latest
    volumes:
      - ./ollama:/root/.ollama
    ports:
      - "11434:11434"
    restart: unless-stopped
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [ gpu ]
  open-webui:
    container_name: open-webui
    image: ghcr.io/open-webui/open-webui:cuda
    ports:
      - "8080:8080"
    volumes:
      - ./open-webui:/app/backend/data
    environment:
      - OLLAMA_API_BASE_URL=http://ollama:11434
      - COMFYUI_BASE_URL=http://comfyui-boot:8188
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [ gpu ]

  comfyui-boot:
    container_name: comfyui
    stdin_open: true
    tty: true
    ports:
      - "8188:8188"
    volumes:
      - './comfyui:/root'
    image: yanwk/comfyui-boot:cu124-slim
    environment:
      - CLI_ARGS=--port 8188 --listen 0.0.0.0 --lowvram --disable-smart-memory --preview-method taesd --fast
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: all
              capabilities: [ gpu ]

  tunnel:
    container_name: tunnel
    image: cloudflare/cloudflared:latest
    command: tunnel  --config "/config.yml" --cred-file "/ecfaffd6-eff3-42ca-8672-fc8c64173810.json" run --protocol http2 --token "${TUNNEL_TOKEN}"
    restart: unless-stopped
    volumes:
      - ./cloudflare/config.yml:/config.yml
      - ./cloudflare/ecfaffd6-eff3-42ca-8672-fc8c64173810.json:/ecfaffd6-eff3-42ca-8672-fc8c64173810.json
```
- add `.env` with variables like this
``` toml
# > cloudflared login
# > cloudflared tunnel create <tunnel-name>
TUNNEL_TOKEN="eyJhIjoiNDRhYTY4OWZiYjE5YjBlMTM3MDk1Y2UxZmI4ZTJkOTIiLCJzIjoiK0RKYmg5SzAxQUNIQUhOMGM0NHBPMWM5ek5uQm5ZREloZ0RNb3BMMm1Xaz0iLCJ0IjoiZWNmYWZmZDYtZWZmMy00MmNhLTg2NzItZmM4YzY0MTczODEwIn0="
WEBUI_SECRET_KEY="iyzoEEqQPSPAkWws"
```
- `docker compose up`
- open `localhost:8080` and import settings/models
- change comfyui and ollama url from `127.0.0.1:11434` 
  to `http://<ollama-docker-service-name>:11434`
- 
