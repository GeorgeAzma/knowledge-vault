**Maximal [[Matching]]** can't have any more edges without sharing a vertex
> [!example] Job applicants
> - applicants get chosen for job and no other applicant can be chosen for that job
> also applicant that got chosen for a job can't be chosen for another job too
> - if applicants are chosen in a way that max amount of jobs is taken,
>   that is called [[Maximum Matching]]

``` mermaid
flowchart LR

subgraph Applicant
  AA((1)) ; AB((2)) ; AC((3)) ; AD((4))
end

subgraph Job
  JA((A)) ; JB((B)) ; JC((C))
end

AA ==> JA
AA --> JB
AB ==> JB
AC ==> JC
AD --> JC
```
**bold arrows** are [[Maximum Matching]]
> [!note] `4 -> C` would also be [[Maximum Matching]]

``` mermaid
flowchart LR

subgraph Applicant
  AA((1)) ; AB((2)) ; AC((3)) ; AD((4))
end

subgraph Job
  JA((A)) ; JB((B)) ; JC((C))
end

AA --> JA
AA ==> JB
AB --> JB
AC ==> JC
AD --> JC
```
**bold arrows** are [[Maximal Matching]]
