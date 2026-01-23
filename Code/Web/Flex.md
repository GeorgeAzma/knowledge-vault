- **Flexbox** can have 1 or more **Flex Lines** with
    - **main axis** `default: x-axis`
    - **cross axis** `default: y-axis (top -> bottom)`
### Main Axis Spacing
``` css
justify-content: flex-start; /* items at start of main axis (usually left)   */
justify-content: center;     /* items centered on main axis */
justify-content: flex-end;   /* items at end of main axis (usually right)  */

justify-content: space-between;  /* equal space between items, no space at edges */
justify-content: space-around;   /* equal space between items, edges get half space */
justify-content: space-evenly;   /* equal space between all items including edges */
```
### Cross Axis Spacing
``` css
align-items: flex-start; /* items at start of cross axis (usually up)   */
align-items: center;     /* items centered on cross axis */
align-items: flex-end;   /* items at end of cross axis (usually down)   */
align-items: stretch;    /* default: items stretch to fill cross axis */
``` 
### Flex Properties
```css
/* main/cross axis direction control */
flex-direction: row;            /* default: main-axis left → right, cross-axis top → bottom */
flex-direction: row-reverse;    /* main-axis right → left, cross-axis top → bottom */
flex-direction: column;         /* main-axis top → bottom, cross-axis left → right */
flex-direction: column-reverse; /* main-axis bottom → top, cross-axis left → right */

flex-wrap: wrap;   /* create new flex line if out of space */
flex-wrap: nowrap; /* shrink content if out of space */

gap: 20px;         /* gap along main/cross axis */
row-gap: 20px;     /* gap along cross axis */
column-gap: 20px;  /* gap along main axis */

/* controls alignment between each flexbox with main/cross axis */
align-content: flex-start; /* lines at start of cross axis */
align-content: center;     /* lines centered */
align-content: flex-end;   /* lines packed at end   */

align-content: space-between;  /* equal space up/down of each flexbox, edges have no space */
align-content: space-around;   /* default: equal space up/down of each flexbox, edges have half the space as between content */
align-content: space-evenly;   /* equal space up/down of each flexbox, edges have same space as between content */
```
### Example
center everything horizontally
``` css
display: flex;
flex-direction: column;
align-items: center;
```
