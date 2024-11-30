```
arr = [1,5,-2,3]
pps = [1,6,4,7]

allows for constant sum lookup
sum(arr) = pps[-1]
sum(arr[i]) = pps[i]
sum(arr[2..3]) = arr[3] - arr[1] 
```
### GPU
``` mermaid
graph TD;

A1(0) --> B1{1}
A2(1) --> B1
A3(2) --> B2{5}
A4(3) --> B2
A5(4) --> B3{9}
A6(5) --> B3
A7(6) --> B4{13}
A8(7) --> B4

B1 --> C1{6}
B2 --> C1
B3 --> C2{22}
B4 --> C2

C1 --> D1{28}
C2 --> D1
```
