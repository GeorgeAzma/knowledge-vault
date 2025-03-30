### Formula $-\ln(p_\text{target})$
- If inference output is probability vector `[0.1, 0.3, 0.6]`
> [!note] they add up to one because typically with CCE [[Softmax]] is used for the output
- And if target is [[One Hot Encoding|One Hot Vector]] like `[0, 0, 1]`
- then $p_\text{target}$ is `0.6` or `output[2]`
- so loss is $-\ln(0.6)\approx0.51$
