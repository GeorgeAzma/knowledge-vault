### Files
``` python
# Read
f = open("file.txt", "rb") # read bytes
file = f.read()
line = f.readline()
lines = f.readlines()
f.close()

# Write
with open("file.txt", "") as f: # append
    f.write("hello\n")

os.rename("old.txt", "new.txt")
os.remove("file.txt")
os.mkdir("dir")
os.rmdir("dir")

# Path
os.path.exists("file.txt")
os.path.isdir("folder")
os.path.isfile("file.txt")
os.path.join("folder", "subfolder", "file.txt")  
os.path.abspath("file.txt") # /home/user/file.txt
os.path.dirname("/home/user/file.txt")  # "/home/user"
os.path.basename("/home/user/file.txt") # "file.txt"
os.path.split("/home/user/file.txt")  # ("/home/user", "file.txt")
root, ext = os.path.splitext("archive.tar.gz") # ("archive.tar", ".gz")

# Misc
os.getcwd()

# Note: checkout "pathlib" for more convinient path/file handling
```
### Math
``` python
math.pi, math.e, math.tau, math.inf, math.nan
# float ops
math.ceil(x), math.floor(x)
math.trunc(x) # truncate toward 0
math.copysign(x, y) # return x with sign of y
math.fabs(x) # absolute value (float)
math.fmod(x, y)  # remainder (like %, but float-based)
math.remainder(x, y) # IEEE remainder

# Fns
math.sqrt(x)
math.pow(x, y)
math.exp(x)
math.log(x) math.log(x, base) math.log10(x) math.log2(x)

# Trig
math.sin(x) math.cos(x) math.tan(x)
math.asin(x) math.acos(x)
math.atan(x) math.atan2(y, x)
math.degrees(x) math.radians(x)
math.sinh(x) math.cosh(x) math.tanh(x)
math.asinh(x) math.acosh(x) math.atanh(x)

math.factorial(n) # factorial
math.comb(n, k) # combinations (n choose k)
math.perm(n, k) # permutations
math.gcd(a, b) # greatest common divisor
math.lcm(a, b) # least common multiple
math.isqrt(x) # integer square root

math.isfinite(x)    # not inf or nan
math.isinf(x)
math.isnan(x)
math.frexp(x) # mantissa, exponent (x = m * 2**e)
math.ldexp(m, e) # inverse of frexp
math.modf(x) # (fractional, integer) parts
math.nextafter(x, y) # next float toward y
math.ulp(x) # unit in last place
```
### Lists
``` python
a = [1, "x", 3.14]

# add
nums = [1, 2]
nums.append(3)       # [1, 2, 3]
nums.insert(1, 99)   # [1, 99, 2, 3]
nums.extend([4, 5])  # [1, 99, 2, 3, 4, 5]

# remove
nums = [1, 2, 3, 4]
nums.remove(2)   # remove first matching value → [1, 3, 4]
nums.pop()       # remove last → returns 4 → [1, 3]
nums.pop(0)      # remove by index → returns 1 → [3]
del nums[1:3]      # delete by index (no return)
nums.clear()

list(range(3)) # [1, 2, 3]

# sort
nums.sort(reverse=True) 
words.sort(key=len)  # sort by length
sorted_nums = sorted(nums, key=lambda x: -x)
```
### Data Structures
``` python
# Tuple
t = (1, 2, 3) # tupples are immutable
t[0:2] # (1, 2)
x, y, z = t   # tuple unpacking

# Set
s = {1, 2, 3}
s.add(4)
s.remove(2)
3 in s  # True
s.union({5,6})   # {1,3,4,5,6}

# Dict
d = {'a': 1, 'b': 2}
d['c'] = 3
d.get('b')   # 2
del d['a']

# Deque
dq = deque([1,2,3])
dq.appendleft(0)
dq.pop()
dq.popleft()

h = [3, 1, 4]
heapq.heapify(h) # min heap
heapq.heappush(h, 0)
heapq.heappop(h)  # 0

# other
# + frozenset: immutable set 
# + array.array: typed array, more mem-efficient than list
```
### Errors
``` python
try:
    raise ValueError("x must be non-negative")
except (Exception, SystemExit, KeyboardInterrupt, RuntimeError, ValueError, 
        TypeError, IndexError, KeyError, ZeroDivisionError, FileNotFoundError) as e:
    print("Error:", e)
```
### Iterators
``` python
class Count:
    def __init__(self, max):
        self.max = max
        self.n = 0
    
    def __iter__(self):
        return self  # iterator object
    
    def __next__(self):
        if self.n < self.max:
            self.n += 1
            return self.n
        else:
            raise StopIteration

from itertools import count, cycle, islice

# Infinite counter
for x in islice(count(10, 5), 5):  # [10, 15, 20, 25, 30]
    print(x)

# Cycle through a list infinitely (use islice to limit)
colors = ['red', 'green', 'blue']
for c in islice(cycle(colors), 2): # [R,G,B, R,G,B]
    print(c)
```
### Generators
``` python
def my_gen(n): # counts to 'n'
    i = 1
    while i <= n:
        yield i
        i += 1
    
for x in my_gen(3):
    print(x) # 1, 2, 3

def echo():
    val = None
    while True:
        val = (yield val)
        print("Received:", val)

g = echo()
next(g)           # start generator
g.send("hello")   # prints "Received: hello"
```