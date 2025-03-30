### Code
```Python
	# Finds orientation of 3 points
	# does this by calculating slopes of two lines
	# going from p1 to p2 and p2 to p3
	# if slopes are equal, lines are collinear
	# else if slope of first line is less than
	# slope of second line points are counter clockwise
	# else points are clockwise
	def orientation(p1, p2, p3):
		v = (p2.y - p1.y) * (p3.x - p2.x) - 
			(p2.x - p1.x) * (p3.y - p2.y)
		if v == 0: 
			return 0
		return 1 if v > 0 else 2
```
