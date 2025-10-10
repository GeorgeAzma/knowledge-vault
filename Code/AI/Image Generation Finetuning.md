
|      Method       |   Time   | Memory |  Images   |             Use Case              |
| :---------------: | :------: | :----: | :-------: | :-------------------------------: |
|     [[LoRA]]      |  `30m`   | `80mb` | `10-100+` |  learn style/concept, easy swap   |
| Textual Inversion |  `20m`   | `10mb` |  `5-20`   | learn subject using special token |
|    Dreambooth     | `1h-1w`  | `1gb+` |  `3-10`   |       learn concept/subject       |
|    Finetuning     | `1d-1mo` | `1gb+` |   `1k+`   |          learn anything           |
### Training Tips
- prompt should **exclude stuff characteristic to your character** 
  `blue eyes, pink hair, braids...` and include everything else
  this helps model learn what is your character by learning what it's not
- **clean, non-blurry, highres, diverse** data is important
- `network_dim = 32+` for style, `network_dim = 8-32` for character
- `network_alpha = 1-network_dim`, `+network_alpha == +LoRA effect`
  everyone is gonna start looking like your character `even if not specified`
- `steps = 1000-5000` are good, `+steps == +LoRA effect, +character similarity, -diversity`
- `batch_size = 2, gradient_steps = 4` works fine `I think anything works`
### kohya_ss
``` bash
cd kohya_ss
./setup.sh
source ./venv/bin/activate # might already be in venv
py sd-scripts/sdxl_train_network.py --config_file data/config.toml

# kohya_ss/data/
# |- images/1_concept/ (1 is repeat count)
# |- output/
# |- logs/
# |- sdxl.safetensors
# |- gen-caps.sh
# |- train.sh
# |- rm-cache.sh
# |- rename.sh
# |- graph.sh
# |- prompt.txt
# |- config.toml
```
`config.toml`
``` toml
pretrained_model_name_or_path = "data/waiNSFW_v14.safetensors"
train_data_dir = "data/images"
# reg_data_dir = "/home/lumi/code/kohya_ss/data/reg"
output_dir = "data/output"
logging_dir = "data/logs"
output_name = "nazuna"

# in comfyui set: lora_strength = 0.80
LoRA_type = "Standard"

# [Option 1] better results, manual learning rate
optimizer_type = "AdamW" # or AdamW8bit
lr_scheduler = "constant" # or cosine
# optimizer_args = ["betas=0.9,0.99", "weight_decay=0.01"]
learning_rate = 3e-5 # [3e-6; 8e-5]

# [Option 2] decent results, auto learning rate
# lr_scheduler = "constant" # or cosine, cosine_with_restarts, constant_warmup
# optimizer_type = "Prodigy"
# optimizer_args = ["decouple=True", "weight_decay=0.01", "d_coef=1", "use_bias_correction=True", "safeguard_warmup=True"]
# learning_rate = 1

max_train_steps = 4000
# max_train_epochs = 50
network_alpha = 32 # try [1, 4, 16]
network_dim = 32
max_token_length = 225

mixed_precision = "fp16"
save_precision = "fp16"

resolution = "1024,1024"
max_resolution = "1024,1024"
caption_extension = ".txt"

save_every_n_epochs = 1
train_batch_size = 2
gradient_accumulation_steps = 1

cache_latents = true
cache_latents_to_disk = true
cache_text_encoder_outputs = true
cache_text_encoder_outputs_to_disk = true

lowvram = true
gradient_checkpointing = true
network_train_unet_only = true

xformers = true
flip_aug = true

enable_bucket = true
min_bucket_reso = 704
max_bucket_reso = 2048
bucket_reso_steps = 64

network_module = "networks.lora"

# Needs more VRAM
# sample_every_n_steps = 100
# sample_prompts = "/home/lumi/code/kohya_ss/data/prompt.txt"
# sample_sampler = "dpmsolver++"
```
`gen-caps.sh`
``` bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../.venv/bin/activate"

python "$SCRIPT_DIR/../sd-scripts/finetune/tag_images_by_wd14_tagger.py" --onnx --repo_id SmilingWolf/wd-swinv2-tagger-v3 --remove_underscore --character_threshold 1 --thresh 0.3 --recursive "$SCRIPT_DIR/images"
python "$SCRIPT_DIR/tag.py" "$SCRIPT_DIR/images/1_nazuna"

python "$SCRIPT_DIR/../sd-scripts/finetune/tag_images_by_wd14_tagger.py" --onnx --repo_id SmilingWolf/wd-swinv2-tagger-v3 --remove_underscore --character_threshold 0.4 --thresh 0.3 --recursive "$SCRIPT_DIR/reg"
```
`train.sh`
``` bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $SCRIPT_DIR/../.venv/bin/activate

latest_ckpt=$(ls -t $SCRIPT_DIR/output/*.safetensors | head -n 1)
if [[ -z "$latest_ckpt" ]]; then
    python $SCRIPT_DIR/../sd-scripts/sdxl_train_network.py --config "$SCRIPT_DIR/config.toml" --save_state
else
    python $SCRIPT_DIR/../sd-scripts/sdxl_train_network.py --config "$SCRIPT_DIR/config.toml" --save_state --network_weights "$latest_ckpt"
fi
```
`rm-cache.sh`
``` bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rm $SCRIPT_DIR/images/*/*.npz
rm $SCRIPT_DIR/reg/*/*.npz
```
`graph.sh`
``` python
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
latest_log=$(ls -dt $SCRIPT_DIR/logs/* | head -n 1)
source $SCRIPT_DIR/../.venv/bin/activate
pkill tensorboard
tensorboard --logdir "$latest_log" &
sleep 3
xdg-open http://localhost:6006
```
`rename.sh`
``` bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
img_dir="$SCRIPT_DIR/images/"
rm $img_dir/*/*.txt
rm $img_dir/*/*.npz
n=1
for f in $img_dir/*/*.*; do
  ext="${f##*.}"
  dir=$(dirname "$f")
  new=$(printf "%03d.%s" "$n" "$ext")
  mv -i -- "$f" "$dir/$new"
  ((n++))
done
```
`tag.py`
``` python
import os
import re
import sys
from PIL import Image
import cv2
import numpy as np

REMOVE_TAGS = [
    "braided hair rings", "blue eyes", "pink hair", "fangs", "zettai ryouiki",
    "1girl", "black nails", "meme", "abyssal ship", "small breasts", "vampire",
    "parody", "hair rings", "ringed eyes", "blunt bangs", "bangs", "braids", "braid"
]
SATURATION_THRESHOLD = 0.001
HUE_THRESHOLD = 0.03

IMG_DIR = sys.argv[1]
if not os.path.isdir(IMG_DIR):
    print(f"Error: '{IMG_DIR}' is not a directory")
    sys.exit(1)

def detect_monochrome(image):
    hsv = cv2.cvtColor(image, cv2.COLOR_RGB2HSV)
    saturation = (hsv[:, :, 1] / 255).mean()
    hue = (hsv[:, :, 0] / 179).std()
    if saturation < SATURATION_THRESHOLD:
        return "greyscale"
    if hue < HUE_THRESHOLD:
        return "monochrome"
    return None

def clean_and_update_tags(txt_path):
    quality_tags = []
    image = Image.open(img_path).convert("RGB")
    image = np.array(image)

    monochrome = detect_monochrome(image)
    if monochrome is not None:
        quality_tags.append(f"{monochrome}")

    if os.path.exists(txt_path):
        with open(txt_path, "r", encoding="utf-8") as f:
            content = f.read().strip()
    else:
        content = ""

    # prepend "nazuna, " if missing
    if not content.startswith("nazuna, "):
        content = "nazuna, " + content if content else "nazuna"

    # remove unwanted tags, or tags specific to "nazuna" character
    for tag in REMOVE_TAGS:
        content = re.sub(rf",\s*{re.escape(tag)}", "", content)

    # append quality tags if missing
    for qtag in quality_tags:
        if qtag not in content.split(", "):
            content += f", {qtag}"

    # cleanup any double commas/spaces
    content = re.sub(r",\s*,", ",", content)
    content = re.sub(r"\s+", " ", content).strip().strip(",")

    # save back
    with open(txt_path, "w", encoding="utf-8") as f:
        f.write(content)


files = os.listdir(IMG_DIR)
files.sort()
for file in files:
    if file.lower().endswith((".webp", ".webp", ".webp", ".webp")):
        img_path = os.path.join(IMG_DIR, file)
        txt_path = os.path.splitext(img_path)[0] + ".txt"
        clean_and_update_tags(txt_path)
```

**Resource** rentry.org/59xed3
### Experiments
``` toml
# works best
network_dim = 32
network_alpha = 32
max_train_steps = 4000

# works, but might be generating disfigured outputs
network_alpha = 1

# anything works
train_batch_size = 1
gradient_accumulation_steps = 1
```
