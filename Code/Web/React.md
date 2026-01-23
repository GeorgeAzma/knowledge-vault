### Hooks
##### `useState(value)`
``` jsx
// rerenders when count is changed via setCount()
const [count, setCount] = useState(0);
<button onClick={() => setCount(count + 1)}>Increment</button>
```
##### `useRef(value)`
``` jsx
// like a static mut value, no rerender
const inputRef = useRef(null);
inputRef.current // holds current value

<input ref={inputRef} />
<button onClick={() => inputRef.current.focus()}>Focus Input</button>
```

##### `useEffect(() => {}, [dep_state])`
executes when dependency changes, runs after render
``` jsx
useEffect(() => {
  document.title = `Count: ${count}`;
}, [count]);

useEffect(() => {
  // dep=[] runs once on mount (when component renders first time)
}, []);
```
