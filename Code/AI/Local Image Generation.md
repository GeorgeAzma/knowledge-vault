### Setup ComfyUI
- `pip install comfy-cli`
- `comfy --workspace="C:\comfy" install`
- `comfy launch -- --lowvram --disable-smart-memory --preview-method taesd --fast`
- open 127.0.0.1:8188
### Setup Image Gen Workflow
- download safetensors civitai.com/models/827184/wai-nsfw-illustrious-sdxl
- copy model to `models/checkpoints` folder where `main.py` is
- load ComfyUI's image gen workflow
- change model to `waiNSFWIllustrious_v130.safetensors`
- write `positive` and `negative` prompts
- for `negative` write `sketch, bad quality, worst quality` or leave it blank
- hit run and wait
### Faster Inference `x2`
- download TensorRT Node
- create engine from SDXL model
- load engine using TensorRT Loader
- use It instead of SDXL model
### Other Potentially Useful Stuff
huggingface.co/kekusprod/WAI-NSFW-illustrious-SDXL-v110-GGUF/blob/main/README.md
huggingface.co/John6666/wai-nsfw-illustrious-v110-sdxl/blob/main/vae/diffusion_pytorch_model.safetensors
