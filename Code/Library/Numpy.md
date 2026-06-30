### Init
``` python
import numpy as np

np.array([1, 2, 3])
np.zeros((3, 4))
np.ones((2, 2))
np.full((3, 3), 7)
np.eye(4) # identity matrix

np.arange(0, 10, 2) # [0,2,4,6,8]
np.linspace(0, 1, 5) # 5 evenly spaced points

np.random.rand(3, 3) # uniform [0,1)
np.random.randn(3, 3) # normal distribution
np.random.randint(0, 10, (2, 3))

a.view() # same memory
a.copy() # independent
```
### Properties
``` python
a.shape
a.ndim
a.size
a.dtype
a.T
a.astype(np.float32)
```
### Slicing
``` python
a[0] # 1st row
a[-1] # last row
a[1:5] # row 1-5
a[:, 0] # 1st column
a[0, :] # 1st row
a[1:3, 2:4] # row 1-3, col 2-4
a[a > 0] # boolean mask
```
### Shape
``` python
a.reshape(3, 4)
a.ravel()        # flatten (view)
a.flatten()      # flatten (copy)

np.expand_dims(a, axis=0)
np.squeeze(a)

np.concatenate([a, b], axis=0)
np.vstack([a, b])
np.hstack([a, b])
np.split(a, 3)
```
### Functions
``` python
np.sum(a, axis=0)
np.mean(a, axis=1)
np.std(a)
np.var(a)

np.min(a)
np.max(a)
np.argmin(a)
np.argmax(a)


np.random.seed(0)
np.random.choice([1,2,3,4], size=3)
np.random.shuffle(a)
np.random.normal(0, 1, (3,3))


np.unique(a)
np.where(a > 0, 1, 0)

np.clip(a, 0, 1)

np.isnan(a)
np.isinf(a)
```
### [[Solving Linear Systems|Linear Algebra]]
``` python
np.dot(a, b)
a @ b              # matrix multiply

np.linalg.inv(A)
np.linalg.det(A)
np.linalg.eig(A)
np.linalg.svd(A)

np.linalg.solve(A, b)
```
