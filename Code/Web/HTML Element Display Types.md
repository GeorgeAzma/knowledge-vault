### Block-Level
start on a new-line, take up full width available
``` html
<div>
<h1>
<p>
<form>
<header>
<footer>
```
`width/height` is used
``` css
span {
    width: 100px,
    height: 100px,
}
```
### Inline
do not start on a  new-line, width limited to what is needed
``` html
<span>
<img>
<a>
```
`width/height` is ignored, uses minimum needed `width/height` instead
``` css
span {
    width: 100px,
    height: 100px,
}
```
### Inline-Block
same as `inline` but `width/height` can be applied
``` css
span {
    display: inline-block,
    width: 100px,
    height: 100px,
}
```
### Notes
- `<span style="display: block"> == <div>`
- `<div style="display: inline"> == <span>`
