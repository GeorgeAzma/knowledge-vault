- Points `VK_PRIMITIVE_TOPOLOGY_POINT_LIST`
- Lines `VK_PRIMITIVE_TOPOLOGY_LINE_LIST`
- Line Strip `VK_PRIMITIVE_TOPOLOGY_LINE_STRIP`
    - `line = prev_vertex -> vertex`, so uses 1 vertex per line, half the data
- Triangles `VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST`
- Triangle Strips `VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP`
    - `tri = vertex[-2] -> vertex[-1] -> vertex` uses 1 vertex per triangle, 3x less data
- Triangle Fans `VK_PRIMITIVE_TOPOLOGY_TRIANGLE_FAN`
    - all triangles share a vertex, also their edges are connected, so 1 vertex per triangle
- Patches `VK_PRIMITIVE_TOPOLOGY_PATCH_LIST`
    - $n$ control points defining shape of tesselated patch of triangles
### Adjacency
has extra invisible lines at the start and end, used in geometry shaders
- `VK_PRIMITIVE_TOPOLOGY_LINE_LIST_WITH_ADJACENCY`
- `VK_PRIMITIVE_TOPOLOGY_LINE_STRIP_WITH_ADJACENCY`
- `VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST_WITH_ADJACENCY`
-  `VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP_WITH_ADJACENCY`