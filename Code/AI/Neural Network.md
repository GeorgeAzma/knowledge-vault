- [[PyTorch Convolution]]
- [[Recurrent Neural Network]]
### How it works
- ##### Forward Propagation
	- Define topology (e.g. size of inputs, hidden neurons, outputs)
	- inputs are N numbers from -1 to 1
	- They get forwarded to the next layer by multiplying them by weights connecting to all the next neurons and adding bias
	- Do forwarding for all the layers, until you get the output
	- Neurons can have [[Activation Function]], which maps their output
	- That will make sure that outputs can be non-linear
- ##### Back Propagation
	- Get difference of outputs and expected outputs (targets)
	- Map that difference using a [[Loss Function]] to get loss
	- Calculate gradient by backpropagating loss using [[Chain Rule]] 
	- Gradient tells how to nudge all the weights for better prediction and lower loss using [[Gradient Descent]]
	- Add up all the gradients from each input vector in a batch
	- Nudge all weights by the gradient multiplied by [[Learning Rate]]
	- Repeat $epochs$ times

> [!note]
> - Mini-Batch [[Gradient Descent]] is most used
>   it calculated gradient from multiple (e.g. $64$) inputs
> - Input vectors in a batch can be shuffled for better results
> - Learning rate can decrease after each epoch for faster convergence
> - You can use different [[Optimizer]] instead of [[Stochastic Gradient Descent|SGD]]
> - Some optimizers have momentum, which is going to take into account previous gradients into current gradient calculations, you can have momentum parameter which decides how much previous gradients affects current one (typically it's 0.9)
### Code
``` rust
///////////// Initialization //////////////
l1 = Linear::new(inputs.size(1), 16);
l2 = Linear::new(16, targets.size(1));
// Random weights (biases are zero, epsilon ~= 0.1)
l1.init(|_| (rng.gen() * 2.0 - 1.0) * epsilon);
l2.init(|_| (rng.gen() * 2.0 - 1.0) * epsilon);

///////////// Forward /////////////////////
let x = ...; // Input
let z1 = l1.forward(&x); // 1st layer output
let a1 = z1.apply(relu); // 1st layer activated output
let z2 = l2.forward(&a1.as_ref()); // last layer output
// Apply softmax to last layer to get probabilities
// for a specific classes in a classifier network
// Note: probabilities add up to 1
let a2 = z2.softmax(); // Final network output/prediction


///////////// Backward ////////////////////
let y = ...; // Targets
let a2_dt = &y - &a2; // Difference between predicted and target values
// Backpropagate the difference/gradient with softmax derivative
let z2_dt = &a2_dt * &a2.apply(|x| x * (1.0 - x));
// Backprop gradient taking into account weight
// Because more weight has power to change loss more
let a1_dt = z2_dt.matmul(&l2.weights.t()).squeeze();
// Backprop gradient with relu derivative
let z1_dt = &a1_dt * &a1.apply(relu_dt);

///////////// Deltas ////////////////////
// z2_dt is final neuron output differences 
// that we want to achieve for better loss
// some weights are more important to reduce loss
// than others, e.g. large weights with large input
// have large influence on output
// so we change that weight more for better loss
delta_weights2 += &a1.outer(&z2_dt);
// Biases aren't dependent on input, so we don't scale
delta_biases2 += &z2_dt;
delta_weights1 += &x.outer(&z1_dt);
delta_biases1 += &z1_dt;

///// Note: Forward, Backward, Deltas steps are usually done
///// x32 times in a mini-batch and weights are updated in the end

///////////// Update /////////////////////
// Do this at the end of mini-batch
l1.weights += delta_weights1 * learning_rate;
l1.biases += delta_biases1 * learning_rate;
l2.weights += delta_weights2 * learning_rate;
l2.biases += delta_biases2 * learning_rate;
```
