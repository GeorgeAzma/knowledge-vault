``` bash
python -c "import importlib.util, subprocess, sys; s=importlib.util.find_spec('torch'); ok=False; exec('import torch; ok=torch.cuda.is_available()') if s else None; sys.exit(0) if ok else subprocess.check_call([sys.executable,'-m','pip','install','--upgrade','--force-reinstall','torch','torchvision','torchaudio','--index-url','https://download.pytorch.org/whl/cu128'])"
```
### [[PyTorch Tensors]]
### [[PyTorch Training]]
### [[PyTorch Convolution]]
### Other
- [[Pytorch Custom Image Dataset]]
