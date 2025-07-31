### Random Index

|           Structure           |  Get   |  Add   |  Del   |  Find  | Resize |  Memory   | Sorted | Unique  |                Info                |
| :---------------------------: | :----: | :----: | :----: | :----: | :----: | :-------: | :----: | :-----: | :--------------------------------: |
|        Stack<br>Array         |  $1$   |  $n$   |  $n$   |  $n$   |  $n$   |    $n$    |   No   |   No    |                                    |
|       FIFO<br>VecDeque        |   1    |  $n$   |  $n$   |  $n$   |  $n$   |    $n$    |   No   |   No    |         Double ended queue         |
|            HashSet            |  $1$   |  $1$   |  $1$   |  $1$   |  $n$   |   ~$3n$   |   No   | ==Yes== |      **Add** worstcase $\log$      |
|            HashMap            |  $1$   |  $1$   |  $1$   |  $1$   |  $n$   |   ~$3n$   |   No   |   Yes   |                                    |
|            TreeSet            | $\log$ | $\log$ | $\log$ | $\log$ |  $1$   |   ~$2n$   |  Yes   |   Yes   |                                    |
|          LinkedList           |  $n$   |  $1$   |  $1$   |  $n$   |  $1$   | ~$2$-$4n$ |   No   |   No    |        **Add/Del** via ptr         |
|             Heap              |  $1$   | $\log$ | $\log$ |  $n$   |  $1$   |   ~$2n$   |  Yes   |   No    | **Get** min/max<br>$>1$ nodes/vals |
|           SkipList            | $\log$ | $\log$ | $\log$ | $\log$ |  $1$   | $n\log n$ |  Yes   |   No    |                                    |
| Binary Heap<br>Priority Queue |  $1$   | $\log$ | $\log$ | $\log$ |  $1$   |    $n$    |  Yes   |   No    |          **Get** min/max           |
### Last Index
| Structure  | Get | Add | Del |
| :--------: | :-: | :-: | :-: |
|   Array    | $1$ | $1$ | $1$ |
|    FIFO    |  1  | $1$ | $1$ |
|  HashSet   | $1$ | $1$ | $1$ |
|  HashMap   | $1$ | $1$ | $1$ |
| LinkedList | $1$ | $1$ | $1$ |
### First Index
| Structure  | Get | Add | Del |
| :--------: | :-: | :-: | :-: |
|   Array    | $1$ | $n$ | $n$ |
|    FIFO    |  1  | $1$ | $1$ |
|  HashSet   | $1$ | $1$ | $1$ |
|  HashMap   | $1$ | $1$ | $1$ |
| LinkedList | $1$ | $1$ | $1$ |
