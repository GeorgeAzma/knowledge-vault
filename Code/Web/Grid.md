https://css-tricks.com/css-grid-layout-guide/
https://youtu.be/JYfiaSKeYhE
``` css
.grid-container {
    display: grid;
    grid-template-columns: 200px 200px 200px; /* 3x 200px columns */
    grid-template-rows: repeat(3, 1fr); /* 3x rows, fr = fraction, deduced from container size */
    grid-template-rows: repeat(auto-fit, minmax(200px, 1fr)); /* use rows = width / 200px, if extra space remains, fill it */
    gap: 1em; /* gap between items */

    /* horizontal alignment for item in the cell */
    justify-items: start;
    justify-items: center;
    justify-items: end;
    /* vertical alignment for item in the cell */
    align-items: start;
    align-items: center;
    align-items: end;

    place-items: start;
    place-items: center;
    place-items: end;
    
    /* columns alignment in container */
    justify-content: start;
    justify-content: center;
    justify-content: end;
    /* rows alignment in container */
    align-content: start;
    align-content: center;
    align-content: end;

    /* dynamic grid */
    grid-auto-rows: 300px; /* auto generated cell size */
    grid-auto-flow: row; /* default: row, new elements are added as new row */

    /* join grid cells based on cell name */
    grid-template-areas: 
    "box-1 box-2 box-2 box-3"
    "box-1 box-4 box-5 box-5";
    
    /* use same name for multiple elements to stack them */
    grid-template-areas: "stack";
}

.item {
    width: 100px; /* different from grid cell size */
}

/* name items */
<div style="grid-area: box-1"></div>
<div style="grid-area: box-2"></div>
<div style="grid-area: box-3"></div>
<div style="grid-area: box-4"></div>
<div style="grid-area: box-5"></div>
```
<div style="display: grid; grid-auto-columns: 150px; grid-auto-rows: 150px; gap:1em; text-align: center; align-items: center; padding: 1em; grid-template-areas: 'box-1 box-2 box-2 box-3' 'box-1 box-4 box-5 box-5'">
  <div style="padding:2em; background-color: #242424; border-radius: 8px; grid-area: box-1">Item 1</div>
  <div style="padding:2em; background-color: #242424; border-radius: 8px; grid-area: box-2">Item 2</div>
  <div style="padding:2em; background-color: #242424; border-radius: 8px; grid-area: box-3">Item 3</div>
  <div style="padding:2em; background-color: #242424; border-radius: 8px; grid-area: box-4">Item 4</div>
  <div style="padding:2em; background-color: #242424; border-radius: 8px; grid-area: box-5">Item 5</div>
</div>
