### Techniques
- **Face Culling**: Adjacent faces are culled
- **Frustum Culling**: Objects that are not inside camera view are culled
- **Occlussion Culling**: Objects that are blocked by other objects are culled
- **Octant Culling**: If object is to camera's right, it's left faces are culled etc.
- **Directional Culling**: If face normal is pointing away from camera it's culled
### Technique Details
- **Frustum Culling**: You can use a triangle, if there are no objects up/down
- **Occlussion Culling**: 
	- **Using Boxes**: Pick big objects and generate a filling rectangle inside it, objects inside that rectangle gets culled (similar to frustum culling)
	- **Hierarchical Z Buffers (HZB)**: Generate mips of depth texture 
