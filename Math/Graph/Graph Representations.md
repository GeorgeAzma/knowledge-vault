- [[Adjacency List]]
- [[Adjacency Matrix]]
- [[Incidence Matrix]] 
- **Edge List** `[(3,4), (3,5), (4,5)]`
- **Paths** `[1,1,2,1,1,3]`
### Edge Operations

|    Representation    |    Get    | Add |  Delete   |   Find    | Memory |
| :------------------: | :-------: | :-: | :-------: | :-------: | :----: |
|    Adjacency List    | $\deg(v)$ | $1$ | $\deg(v)$ | $\deg(v)$ | $V+E$  |
| [[Adjacency Matrix]] |    $1$    | $1$ |    $1$    |    $1$    | $V^2$  |
|      Edge List       |    $E$    | $1$ |    $E$    |    $E$    |  $2E$  |
|        Paths         |    $E$    | $1$ |    $E$    |    $E$    |  $E$   |
### Vertex Operations

|    Representation    | Get |    Add    | Delete | Find |
| :------------------: | :-: | :-------: | :----: | :--: |
|    Adjacency List    | $1$ |    $1$    |  $V$   | $V$  |
| [[Adjacency Matrix]] | $1$ |   $V^2$   | $V^2$  | $1$  |
|      Edge List       | $E$ | $\deg(v)$ |  $E$   | $E$  |
|        Paths         | $E$ |    $1$    |  $E$   | $E$  |
- `if adjacency list is sparse then get() is O(V)`
- `add/del rebuilds adjacency matrix so it's O(V^2)`
