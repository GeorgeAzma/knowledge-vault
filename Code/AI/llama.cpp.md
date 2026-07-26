``` bash
git clone https://github.com/ggml-org/llama.cpp.git

# "--config Release -j" not necessary for Ninja
cmake -B build -G Ninja -DGGML_CUDA=ON -DGGML_NATIVE=ON -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -j

./build/bin/llama-server -m model.gguf -c 8192

# optionally: add ./build/bin/ to path

llama-cli -m "model.gguf" -ngl all -fa on -c 8192 -ub 2048 -b 8192 -t 8 -ctk q8_0 -ctv q8_0
```
#### Parameters
``` bash
-ngl all # layers to store in VRAM
-ncmoe 30 # MoE experts to keep on CPU. use -cmoe for all layers
-fa on # flash attention

-c 8192 # context size

-ctk q8_0 # f32, f16, bf16, q8_0, q4_0, q4_1, iq4_nl, q5_0, q5_1
-ctv q5_1 # f32, f16, bf16, q8_0, q4_0, q4_1, iq4_nl, q5_0, q5_1
-kvo, -nkvo # KV cache offloading [enabled]

-b # batch size
-ub # physical batch size

-t # threads

--mlock # avoid swapping or compressing model memory stored on RAM

--temp --top-k --top-p --min-p

-sys # system message
-p # prompt
-n # tokens to predict
```
