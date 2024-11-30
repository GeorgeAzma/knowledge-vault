- Have multiple heads of [[Self Attention]] `typically 8`
- Get outputs from all the layers of self attention
- Multiply the outputs by the $w^O$ weight matrix which will 
  reduce the size of the outputs from $n_{outputs}$ to $n_{outputs} \div n_{heads}$
- You can also add dropout layer at the end
