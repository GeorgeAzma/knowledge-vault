### Random Index

| Structure  |  Get   |  Add   |  Del   |  Find  |  Memory   |
| :--------: | :----: | :----: | :----: | :----: | :-------: |
|   Array    |  $1$   |  $n$   |  $n$   |  $n$   |    $n$    |
|    FIFO    |   1    |  $n$   |  $n$   |  $n$   |    $n$    |
|  HashSet   |  $1$   |  $1$   |  $1$   |  $1$   |   ~$4n$   |
|  HashMap   |  $1$   |  $1$   |  $1$   |  $1$   |   ~$4n$   |
| LinkedList |  $n$   |  $1$   |  $1$   |  $n$   | ~$2$-$4n$ |
|    Heap    |  $1$   | $\log$ | $\log$ |  $n$   |   ~$2n$   |
|  SkipList  | $\log$ | $\log$ | $\log$ | $\log$ | $n\log n$ |
- `Stack = Array`
- `Fifo = VecDeque = Double Ended Queue`
- `Heap = sorted binary tree with multiple values for nodes`
`LinkedList add/del is O(1) using node ptr, otherwise O(n)`
### Last Index
| Structure  | Get | Add | Del |
| :--------: | :-: | :-: | :-: |
|   Array    | $1$ | $1$ | $1$ |
|    FIFO    |  1  | $1$ | $1$ |
|  HashSet   | $1$ | $1$ | $1$ |
|  HashMap   | $1$ | $1$ | $1$ |
| LinkedList | $1$ | $1$ | $1$ |
- `Singly linked list is O(n) last del/add without last node ptr`
### First Index
| Structure  | Get | Add | Del |
| :--------: | :-: | :-: | :-: |
|   Array    | $1$ | $n$ | $n$ |
|    FIFO    |  1  | $1$ | $1$ |
|  HashSet   | $1$ | $1$ | $1$ |
|  HashMap   | $1$ | $1$ | $1$ |
| LinkedList | $1$ | $1$ | $1$ |
