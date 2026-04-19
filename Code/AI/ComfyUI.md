``` bash
sudo apt update  
sudo apt install python3 python3-venv git

git clone https://github.com/comfyanonymous/ComfyUI
cd ComfyUI

python -m venv venv
source venv/bin/activate # Windows: venv\Scripts\activate

python -m pip install --upgrade pip

pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
pip install -r requirements.txt
pip install -r manager_requirements.txt

python main.py --enable-manager --lowvram --disable-smart-memory --preview-size 256 --fast --listen 0.0.0.0

wget -c --show-progress -O /mnt/c/apps/ComfyUI/models/checkpoints/wai-16.safetensors 'https://civi
tai.com/api/download/models/2514310?type=Model&format=SafeTensor&size=pruned&fp=fp16'
```
> [!tip] Faster Inference `x2`
> - download TensorRT Node
> - create engine from SDXL model
> - load engine using TensorRT Loader
> - use It instead of SDXL model
### Via API
``` python
import json
import random
from urllib import request

prompt = "masterpiece best quality"

def queue_prompt(prompt):
    p = {"prompt": prompt}
    data = json.dumps(p).encode('utf-8')
    req =  request.Request("http://127.0.0.1:8188/prompt", data=data)
    request.urlopen(req)


with open("anime-gen.json", "r") as f:
    prompt = json.load(f)
prompt["6"]["inputs"]["text"] = prompt
prompt["22"]["inputs"]["seed"] = random.randint(0, 2**32 - 1)

queue_prompt(prompt)
```
### Connect OpenWebUI To ComfyUI
open `admin panel > settings > images`
- `image generation: on`
- `ComfyUI base url: 127.0.0.1:8188`
- `ComfyUI workflow:` export ComfyUI workflow as API `developer settings must be on` and load
- see which `node_id` holds prompt, which holds `checkpoint` etc
  and assign these `node_ids` to corresponding fields
- set default model to `wai-16.safetensors`
- set image generation size to `1024x1024 (~1 megapixel works best)`
- set steps to `20-40`
### Image Generation Workflow

|  Node  |    Name     | ID  |
| :----: | :---------: | :-: |
| Prompt |   `text`    |  6  |
| Model  | `ckpt_name` |  4  |
| Width  |   `width`   |  5  |
| Height |  `height`   |  5  |
| Steps  |   `steps`   |  3  |
|  Seed  |   `seed`    |  3  |
##### Wai
``` json
{
  "3": {
    "inputs": {
      "seed": 42,
      "steps": 20,
      "cfg": 4,
      "sampler_name": "er_sde",
      "scheduler": "beta",
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
      "ckpt_name": "wai-16.safetensors"
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
      "text": "",
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
      "text": "bad quality, worst quality",
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
