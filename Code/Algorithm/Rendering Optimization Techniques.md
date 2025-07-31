### Techniques
- **Face Culling** adjacent faces are culled
- **Frustum Culling** objects that are not inside camera view are culled
- **Occlussion Culling** objects that are blocked by other objects are culled
- **Octant Culling** if object is to camera's right, it's left faces are culled etc.
- **Directional Culling** if face normal is pointing away from camera it's culled
### Technique Details
- **Frustum Culling** you can use a triangle, if there are no objects up/down
- **Occlussion Culling**
	- **Using Boxes** pick big objects and generate a filling rectangle inside it, objects inside that rectangle gets culled (similar to frustum culling)
	- **Hierarchical Z Buffers (HZB)** generate mips of depth texture 
