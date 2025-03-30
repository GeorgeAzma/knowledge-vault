**Maximum [[Matching]]** is [[Maximal Matching]] with most edges
> [!example] Job applicants
> - applicants get chosen for job and no other applicant can be chosen for that job
> also applicant that got chosen for a job can't be chosen for another job too
> - if applicants are chosen in a way that max amount of jobs is taken,
>   that is called [[Maximum Matching]]
### Augmenting Path
let $M$ be maximal matching
- $M$-saturated vertex is vertex that has an edge from $M$
- $M$-alternating path $P$ is uses alternately edges from $M$ and non-$M$ edge set
  where both end vertices of $P$ are unsaturated
### Finding Maximum Matching $O(VE)$
find [[#Augmenting Path]] that has first/last vertices unsaturated and edges alternate between matched/unmatched
start from first and match it's edge that is connected to next vertex in path
since edge is now matched, unmatch next edge in path
since edge is now unmatched, match next edge in path,
repeat for all $M$-alternating paths until you get maximum matching
`when there is no path with first/last nodes unsaturated`
- youtu.be/ELcgI_C1mNM?t=480 uses bfs to traverse from unsaturated node
  and end up in last unsaturated node and just apply to algorithm to the path
  then try find augmented path again until there is none
**Hopcroft-Karp Algorithm** improves this to $O(\sqrt{V}E)$
### Berge's Theorem
Does [[#Finding Maximum Matching $O(VE)$|Finding Maximum Matching]] algorithm always find maximum matchings?
Berge's Theorem says **Yes**, if there is no more [[#Augmenting Path]] in graph
then it is maximum matching
### Maximum Weighted Matching
- **Hungarian / Kuhn-Munkres Algorithm** for [[Bipartite Graph]]
- **Edmonds' Algorithm** for Non-[[Bipartite Graph]]
- **Blossom Algorithm** for any graph `best algorithm name`
