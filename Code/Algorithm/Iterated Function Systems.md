- Sierpinski triangle
- Barnsley fern
### How It Works
- Choose a random point (usually x,y range of -1 to 1)
- Have an array of functions (Sierpinski functions):
``` rust
|p| ((p.x - 1) * 0.5, (p.y - 1) * 0.5)
|p| ((p.x + 1) * 0.5, (p.y - 1) * 0.5)
|p| ((p.x + 0) * 0.5, (p.y + 1) * 0.5)
```
- Choose a random function
- Call that function with the random point
- Assign random point to the output of the function
- Color pixel at the function output of the function
