Make hashmap/list of `(vertex, neighbors)` for each vertex
  > [!note] 
  > can be optimized by having single vertex list
  > and vertex neighbors are defined as off/size in that list
  > also if you sort the neighbors, you can binary search it
  > making O(n) lookup into O(log), but add/del is slowed from O(1) to O(E) (terrible)`
