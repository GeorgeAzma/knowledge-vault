https://help.desmos.com/hc/en-us/articles/360022401451-Probability-Distributions
### Distributions
``` python
# distributions
normaldist(mean=0, stdev=1)
tdist(dof=10, shift=6, scale=1)
chisqdist(dof=10)
uniformdist(min=0, max=1)
binomialdist(trials=10, sucesses=4, probability=0.3)
poissondist(mean=5)
geodist(success_p=0.7) 

# distribution methods
normaldist().pdf(x)
normaldist().cdf(x) # or range like cdf(-1,1)
normaldist().inversecdf(x)

chisqdist().mean
chisqdist().median
chisqdist().var
chisqdist().stdev
normaldist().random(2) # list of samples
```
### List Functions
``` python
mean([1, 5, 5, 10]) # 10.5
median([1, 5, 5, 10]) # 5
minimum([1, 5, 5, 10]) # 1
maximum([1, 5, 5, 10]) # 10

quantile([1,5,5,10], 0.25) # returns value where 25% of data is below it 
quartile([1, 5, 5, 10], 4) # quantile with 4 parts [Q1: 0.25, Q2: 0.5, Q3: 0.75, Q4: 1]

stdev([1, 5, 5, 10]) # sample standard deviation
stdevp([1, 5, 5, 10]) # population standard deviation
var([1, 5, 5, 10]) # sample variance
varp([1, 5, 5, 10]) # population variance
cov(l1, l2) # sample covariance
covp(l1, l2) # population covariance

mad([1, 5, 5, 10]) # mean absolute deviation sum(|x[i] - mu|) / n
corr(l1, l2) # pearson correlation coefficient
spearman(l1, l2) # spearman correlation coefficient
stats([2, 3, 3, 5, 6, 7, 8]) #  (minimum, first quartile, median, third quartile, and maximum values)
count([1, 5, 5, 10]) # 4; element count
total([1, 5, 5, 10]) # sum

repeat([1, 5], [3, 2]) # [1, 1, 1, 5, 5]
join(l1, l2)
sort([5, 1, 5, 10])
shuffle([1, 5, 5, 10])
unique([1, 5, 5, 10])
(a, a) for a = [1,2,3] # graph points; graph lines with (a, a) for 1 < a < 3
histogram([1, 5, 5, 10], 1) # group data into bins using bin width
dotplot([1, 5, 5, 10], 1) # histogram with dots
boxplot([1,5,5,10])
```
### Inference Tests
``` python
ztest(population=[1, 2, 3], stdev=0.5) # population, stdev
ttest(population=[-1, 2, 3]) # add optional argument for two sample t-test
zproptest(45, 80) # z-test for proportions
chisqtest([2, 8], [4, 6]) # chi-square test of independence
chisqgof([30,20,25,25]) # chi-square goodness of fit test

T.null(0)
T.p # p-value
T.pleft # left p-value
T.pright # right p-value
T.score
T.dof
T.stderr
T.conf(0.95) # confidence interval from sampling distribution
T.conf(0.95).lower
T.conf(0.95).upper
T.estimate
```
### Other
``` python
nPr(6, 2) # permutations
nCr(6, 2) # combinations
a→a+1 # updates 'a' when action is ran

rgb(255, 165, 0)
hsv(25, 0.8, 1)
tone(440)

# matrix
matrix(1, 2, 3, 4) # 2x2 matrix
rref(A) # reduced row echelon form
det(A) # determinant
trace(A) # sum of diagonal
A^{-1}
A^2
A^T

```
### Geometry
https://help.desmos.com/hc/en-us/articles/212235786-Supported-Functions#tab-item-generated-3
``` python
# Geometry (p = point, l = line equation, c = circle equation)
midpoint(p1, p2)
intersection(l, c) # returns point
segment(p1, p2) # line segment
line(p1, p2) # unbounded line segment
ray(p1, p2) # line segment bounded before p1, unbounded after p2
parallel(l, p) # creates parallel line at point
perpendicular(l, p) # creates perpendicular line at point
anglebisector(angle) # splits angle into two using a ray
circle(p, l) # circle centered on p, radius defined by line length or point
arc(p1, p2, p3) # curved path through 3 points
angle(p1, p2, p3) # angle between 3 points
directedangle(p1, p2, p3) # angle, but positive counter-clockwise, negative clockwise
polygon(p1, p2, ..., pn) # closed figure made of n points
glider(path, 0.7) # follows path 0-1
vector(p1, p2) # vector with start point, end point

length(segment)
distance(p1, p2)
area(polygon)
perimeter(polygon)
vertices(polygon)
angles(polygon)
directedangles(polygon)
segments(polygon)
radius(circle/arc)
center(circle/arc)
coterminal(angle) # angle that shares initial/terminal side (30 & -330)
supplement(angle)  # two adjacent angles that form a straight angle

vector.start
vector.end

dilate(object, point, 2) # scale object from a point
rotate(object, point, angle)
reflection(object, line) # mirrors object using a line
translation(poly, p1, p2)
```
