### System
- $u$ **inputs** affects system state `steering wheel, accelerator, brake`
- $d$ **disturbances** involuntarily affects system `wind, road bumps`
- $x$ **states** changes over time based on inputs/disturbances `speed, position, direction`
### Feed Forward Controller `open-loop`
- $r$ **reference** our goal for the system `stay at constant speed, drive straight`
- $u$ **control inputs** what to do to ensure goal `press pedal halfway, keep wheel 0 degrees`
##### Feedback Controller `closed-loop`
- $x$ **state** output read from the system `current speed, travelled distance`

open-loop feed forward controller keeps pedal fixed to have constant speed
but when uphill comes speed drops without feed forward controller noticing
that's why we need closed-loop controller which takes in current speed system state for adjustements 

### [[PID]]