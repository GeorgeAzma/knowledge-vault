``` bash
wsl
export DISPLAY=:0
export WAYLAND_DISPLAY=wayland-0
export XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir
sudo apt update
sudo apt install -y vulkan-tools mesa-vulkan-drivers libvulkan1
# not sure if necessary
sudo apt install -y libx11-dev libwayland-dev libxkbcommon-dev
cargo run
```
