- $MAE/L1=|x-y|$ Mean Absolute Error
- $MSE=(x-y)^2$ Mean Squared Error, favors large number of small errors 
  than small number of large errors
- $RMSE=\sqrt{(x-y)^2}$ Root Mean Squared Error, same as $MSE$
    But easier to read for humans
- $CCE=-\ln(p_{target})$ Categorical cross entropy, used for classification problems 
  where output is probability vector and target is a vector like $[0,0,1,0]$
  where $1$ represents correct class, $p_{target}$ is predicted probability
  that it's the same class as target class `output[2] in this case`
> [!note] Probability vector is often calculated using [[Softmax]] 
