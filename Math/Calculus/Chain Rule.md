[[Derivative]] simplification rule
### Formula $\dfrac{d}{dt}f(x)=f'(x)\dfrac{dx}{dt}$
- $f(g(y))=f'(g(y))g'(y)$ since here $x=g(y)$
`useful for machine learning backpropagation`
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
$\dfrac{\partial c}{\partial a}=c'(a,y)$ `how change in activated neuron change cost`
$\dfrac{\partial a}{\partial z}=f'(z)$ `how change in neuron change activated neuron`
$\dfrac{\partial z}{\partial w}=a$ `how does change in weight change neuron`
$\dfrac{\partial c}{\partial w}=\dfrac{\partial z}{\partial w} \dfrac{\partial a}{\partial z} \dfrac{\partial c}{\partial a}$ `how does change in weight change cost`
`if -1 change in weight causes -2 change in cost
`then decrease weight by $-1*LearningRate$`

$\dfrac{\partial z}{\partial b}=1$ `how does change in bias change neuron`
$\dfrac{\partial c}{\partial b}=\dfrac{\partial z}{\partial b} \dfrac{\partial a}{\partial z} \dfrac{\partial c}{\partial a}$ `how does change in bias change cost`
$\dfrac{\partial z}{\partial a_0}=w_0$ `how does change in input change neuron`
