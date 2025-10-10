### Shape
``` python
t = [[1, 2, 3], 
     [4, 5, 6]] # (2, 3)

t.view(3, 2) == [[1, 2],
                 [3, 4],
                 [5, 6]]
t.view(3, -1) # auto-dim (same as above)
 
t.reshape(3, 2)   # like view, but safer
t.T               # transpose
t.transpose(0, 1) # transpose 1st and 2nd dim
t.squeeze()       # remove dims with size 1
t.unsqueeze(0)    # add dim at pos 0
t.flatten() # flatten to 1D
t.flatten(start_dim=1) # flatten all but batch dim
t.size(0) # 0th dim size
```
### Indexing
``` python
t[0]      # 1st row
t[:, 1]   # 2nd col
t[1, 2]   # 1st row 2nd col element
t[1:, :2] # matrix slice
t.index_select(0, torch.tensor([0, 2])) # pick specific rows
```
### Concatenation / Splitting
``` python
a = [1, 2]
b = [3, 4]
torch.cat  ([a, b], dim=0) == [1, 2, 3, 4]   # concat along dim
torch.stack([a, b], dim=0) == [[1,2], [3,4]] # add new dim

x = [1, 2, 3, 4]
torch.chunk(x, 2) == [[1, 2], [3, 4]] # split into 2
torch.split(x, 2) == [[1, 2, 3], [4]] # split into chunks of 3
```
### Utility
``` python
t.clone()  # deep copy
t.detach() # no grad
t.item()   # get single scalar
t.tolist()
t.requires_grad_(True)
torch.save(t, "tensor.pt")
t = torch.load("tensor.pt")
```
### Functions
``` python
t = [1, 2]
t.repeat(2, 3) == [[1,2,1,2,1,2],
                   [1,2,1,2,1,2]]
t = [[1, 2]] # expand only works if expansion dim size is 1
t.expand(2, 2) = [[1,2],
                  [1,2]] # expand to specified dims by repeating (no copy)

### Sort ###
t = [1, 2]
t.sort()         # [2, 1] ascending sort
t.argsort()      # [1, 0] sorted indices
torch.topk(t, 2) # [2, 1] 2 largest values

nn.functional.pad(x, (1, 1, 1, 1)) # (left, right, top, bottom)
```
### Einsum
``` python
"i->"          # sum
"ij->i"        # sum over specific dim
"i,i->"        # dot product
"i,j->ij"      # outer product
"ij->ji"       # transpose
"ij,j->i"      # mat-vec mul
"ij,jk->ik"    # matmul
"bij,bjk->bik" # batch matmul
"ij,jk,kl->il" # chained matmul
```
