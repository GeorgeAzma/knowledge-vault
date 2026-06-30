1. $\mathbf{F}(\mathbf{r})=\mathbf{G}(\mathbf{r})+\mathbf{R}(\mathbf{r})$ any [[vector field]] can be split into curl free + divergence free components
2. $\mathbf{G}(\mathbf{r})=-\nabla\Phi(\mathbf{r})$ [[divergence]] component `note: -phi is arbitrary, it can be +phi`
    - $\nabla\Phi(\mathbf{r})=\cancel{\text{curl}}$ [[gradient]] of scalar field is always [[curl]] free `i.e. it only has divergence`
    - $\cancel{\text{curl}}=\nabla\Phi(\mathbf{r})$ curl free vector field is always gradient of some scalar field
3. $\nabla\cdot\mathbf{R}(\mathbf{r})=0$ curl component `since divergence is 0`
#### Applying [[Divergence]] To Decomposition
- $\nabla\cdot\mathbf{F}(\mathbf{r})=\nabla\cdot\mathbf{G}(\mathbf{r})+\nabla\cdot\mathbf{R}(\mathbf{r})$
- $\nabla\cdot\mathbf{F}(\mathbf{r})=\nabla\cdot\mathbf{G}(\mathbf{r})+0$
- $\nabla\cdot\mathbf{F}(\mathbf{r})=\nabla\cdot(-\nabla\Phi(\mathbf{r}))$
- $\nabla\cdot\mathbf{F}(\mathbf{r})=-\nabla^2\Phi(\mathbf{r})$
- $\Delta\Phi=-\nabla\cdot\mathbf{F}$ [[Poisson Equation]] `scalar field computed using divergence of vector field`
#### Applying [[Curl]] To Decomposition
- $\nabla\times\mathbf{F}=\nabla\times(-\nabla\Phi+\mathbf{R})$
- $\nabla\times\mathbf{F}=\cancel{\nabla\times\nabla\Phi}+\nabla\times\mathbf{R}$
- $\nabla\times\mathbf{F}=\nabla\times\mathbf{R}$
all vorticity/rotation comes entirely from $\mathbf{R}$
