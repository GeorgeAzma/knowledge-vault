developer.download.nvidia.com/compute/cuda/1.1-Beta/x86_website/projects/reduction/doc/reduction.pdf
### Bottlenecks
- `75%` Memory
   - cache efficiency
   - coalescing `index via threadIdx`
   - CPU-[[GPU Architecture]] transfer
   - register spilling
- `10%` Compute
- `10%` Latency
- `5%`   Other
### Vertex Cache
- **Post-Transform Vertex Cache** stores transformed vertices `20 to 40 verts`
  index buffer reuses these vertices, so transforms aren't recalculated
```
idx_buf = 031 134  142 245    364 467  475 578
0-1-2   
|/|/|
3-4-5
|/|/|
6-7-8

processed_verts = 031134142245364467475578
add_hit_miss[4] = +++==+==+==+-+-==+==-==+
cache +add =hit -miss (-miss also adds to cache)

total_vert = 9
total_idxs = 24
cache_size = 4
cache_miss = 3
cache_hits = 12

total_idxs = total_vert + cache_hits + cache_miss = 9 + 12 + 3 = 24
total_calc = total_vert + cache_miss = 9 + 3 = 12
optim_calc = total_vert = 9
efficiency = optim_calc / total_calc = 9 / 12 = 3 / 4 = 0.75
```
