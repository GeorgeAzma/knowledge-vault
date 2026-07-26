1. **Pick a complex moving camera** when a simple fixed view or first-person mode works better
2. **Build levels and cameras separately** so they constantly fight each other and confuse the player
3. **Track the camera using raw map coordinates** instead of simple look angles like pitch and yaw
4. **Position the camera too far back** by default making it easy for walls to block your view
5. **Fail to nudge the camera early** when approaching a wall from the side
6. **Fight the player's joystick movements** with automatic camera corrections
7. **Let the player clip the camera** straight inside solid objects and geometry
8. **Let different camera forces push against each other** instead of giving one priority
9. **Panic and dodge thin poles** that are small enough to briefly pass behind
10. **Forget basic collision on the lens** letting walls cut right through the camera view
11. **Dodge sideways around smooth hills** instead of rising up and gliding over them
12. **Swing left or right** when the camera gets trapped flat against a back wall
13. **Get so close to the character** that the lens cuts inside their body and makes them see-through
14. **Keep the exact same distance** when looking way up or down instead of adjusting for the floor
15. **Keep a tight zoom when looking up** which hides the scale of big skies and structures
16. **Change zoom, distance, and angle separately** causing the character to weirdly shrink and grow
17. **Refuse to cut the camera** when the character walks through thick, solid barriers
18. **Teleport the camera angle instantly** while the player is moving, ruining their steering mid-sprint
19. **Hide familiar landmarks during a cut** making the player lose their sense of direction
20. **Swap the left and right sides of characters** during cutscenes, breaking cinematic rules
21. **Stare only at the character** while completely hiding the cliffs or traps right at their feet
22. **Force the player to constantly babysit the camera** with the right joystick just to look around
23. **Leave the camera staring sideways** while running instead of auto-swinging behind the character
24. **Angle the camera sideways on thin walkways** making it impossible to judge jumps
25. **Keep looking straight ahead at a cliff edge** instead of tilting down to show the drop
26. **Jiggle up and down on bumpy roads** instead of smoothing out the average slope
27. **Center the screen off-balance by tilting** instead of sliding the camera over sideways
28. **Use identical logic for walking and flying** which hides where the character will land
29. **Trust purely automated code** instead of using custom, hand-placed camera markers
30. **Let lost players run backward into dead ends** instead of gently pointing them toward the goal
31. **Spin rapidly to stay between close targets** instead of zooming out to fit both in frame
32. **Slide sideways to look at the distant horizon** when simply rotating the lens is required
33. **Let the character's own back and shoulders** block the view of items directly ahead
34. **Give the player camera control** only to immediately rip it away with a script
35. **Snap back to automatic tracking** the exact microsecond the player lets go of the joystick
36. **Annoy veteran players** by forcing the camera to point at goals they already know by heart
37. **Forget to include simple invert options** for the controller axes in the settings menu
38. **Let accidental controller tilts** send the camera spinning out of control
39. **Use rigid stick sensitivity** instead of a smooth curve that allows for gentle fine-tuning
40. **Let the camera lag so far behind** that the running character sprints right off the screen
41. **Force a narrow field of view** that makes movement feel way too fast and induces motion sickness
42. **Zoom the lens in and out violently** during speed boosts or weapon aiming
43. **Force heavy screen shake on impacts** without an option to turn it completely off
44. **Bounce the camera up and down with head-bobbing** which causes quick nausea
45. **Yank the camera skyward the instant the character jumps** instead of letting them move within the frame
46. **Slam the camera smoothly but way too fast to a new spot** instead of just using a clean cut
47. **Maintain full rotation speed right until hitting the tilt limit** causing a harsh, jarring stop
48. **Design exclusively for VR headsets** completely locking out players prone to severe motion sickness
49. **Test only with a tiny group of friends** who are too polite to admit your game makes them feel sick
50. **Let a math formula automate the framing** resulting in completely unpredictable, messy views