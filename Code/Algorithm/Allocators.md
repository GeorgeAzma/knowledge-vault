
| Allocator |                Fragmentation                | Any Free | Any Size |
| :-------: | :-----------------------------------------: | :------: | :------: |
|   Buddy   | $\large2^{\lceil\log_2{n}\rceil-\log_2{n}}$ |   Yes    |   Yes    |
|   Arena   |                     $0$                     |    No    |   Yes    |
|   Bump    |                     $0$                     |    No    |          |
|   Slab    |                     $0$                     |   Yes    |    No    |
