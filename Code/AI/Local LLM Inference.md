``` bash
winget install Ollama.Ollama
ollama run deepseek-r1:8b
pip install open-webui
open-webui serve
```
### Performance `RTX 3080 10GB`

|     Model     |  Params   | Quantization | Tok/s |  Features   | Intelligence |
| :-----------: | :-------: | :----------: | :---: | :---------: | :----------: |
| `deepseek-r1` |  `1.5b`   |   `Q4_K_M`   | `200` | `reasoning` |   `dummy`    |
| `deepseek-r1` |   `8b`    |   `Q4_K_M`   | `90`  | `reasoning` | `bit dummy`  |
| `deepseek-r1` |   `14b`   |   `Q4_K_M`   | `40`  | `reasoning` |  `average`   |
|   `gemma3`    |   `1b`    |   `Q4_K_M`   | `200` |             |   `dummy`    |
|   `gemma3`    |   `4b`    |   `Q4_K_M`   | `120` |  `vision`   | `bit dummy`  |
|   `gemma3`    |   `12b`   |   `Q4_K_M`   | `15`  |  `vision`   |  `average`   |
|    `qwen3`    |  `0.6b`   |   `Q4_K_M`   | `250` | `reasoning` |   `dummy`    |
|    `qwen3`    |   `8b`    |   `Q4_K_M`   | `90`  | `reasoning` | `bit dummy`  |
|    `qwen3`    | `30b-a3b` |   `Q4_K_M`   | `15`  | `reasoning` |   `smart`    |
|     `qwq`     |   `32b`   |   `Q4_K_M`   |  `5`  | `reasoning` |   `smart`    |
### Usage `RTX 3080 10GB`
- **Complex Coding** `qwen3:30b-a3b`
- **Simple Tasks** `qwen3:0.6b`
- **Simple Vision** `gemma3:4b`
- **Complex Vision** `gemma3:12b`
- **Good Overall** `qwen3:8b`
