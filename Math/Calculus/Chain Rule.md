[[Derivative]] simplification rule
### Formula $f(g(x))=f'(g(x))g'(x)$
`Useful for machine learning backpropagation`
#### Example
- $w_1$ weight
- $w_0$ previous neuron weight
- $b$ bias
- $a_0$ previous activated neuron
- $z=a_0*w+b=\text{Neuron}$
- $f(z)$=[[Activation Function]]
- $a_1=f(z)$
- $y=\text{Target output}$
- $c(a, y)$=$(y-a)^2$=[[Loss Function]] 

##### Differentiation
$\huge \frac{\partial c}{\partial a}=c'(a,y)$ `how change in activated neuron change cost`
$\huge \frac{\partial a}{\partial z}=f'(z)$ `how change in neuron change activated neuron`
$\huge \frac{\partial z}{\partial w}=a$ `how does change in weight change neuron`
$\huge \frac{\partial c}{\partial w}=\frac{\partial z}{\partial w} \frac{\partial a}{\partial z} \frac{\partial c}{\partial a}$ `how does change in weight change cost`
`if -1 change in weight causes -2 change in cost
`then decrease weight by $-1*LearningRate$`

$\huge \frac{\partial z}{\partial b}=1$ `how does change in bias change neuron`
$\huge \frac{\partial c}{\partial b}=\frac{\partial z}{\partial b} \frac{\partial a}{\partial z} \frac{\partial c}{\partial a}$ `how does change in bias change cost`
$\huge \frac{\partial z}{\partial a_0}=w_0$ `how does change in input change neuron`
