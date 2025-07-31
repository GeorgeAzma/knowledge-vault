Separates data into groups
### How It Works
- Initialize $k$ mean points with random values  
- Iterate over points
	- Find closest mean point to points `using euclidian distance`
	- Assign item to that mean point
	- Shift mean point to the average of the points in the cluster
- Iterate till mean points stop moving
### Choosing $k$ Using Elbow Method
- Calculate **Inertia** Sum of squared distances from 
  cluster center to each data point for different $k$s
- Plot $k$s and their inertias, it should be exponentially decreasing
- Point were it becomes almost linear is optimal $k$ 

