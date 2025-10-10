``` python
# expensive finetuning
W'' = finetune(W)
W'' = W + W_dt # equivalent
W.shape = (w_out, w_in)
# total params: w_out * w_in

A.shape = (w_out, rank)
B.shape = ( w_in, rank)
W_dt = A @ B # low-rank decomposition (approximation)
# total params: r * (d_out + d_in)

# higher rank = better approximation
rank = 8 # 4-16

a = 1.0 # hyper-parameter (LoRA strength)
s = a / rank.sqrt() # scaling factor
W'' =  xW + s * x(A@B)
```
Similar to how 2. reduces parameter count in [[Neural Network]][[s]]
1. `big_layer` => `big_layer`
2. `big_layer` => `small_layer` => `big_layer`
