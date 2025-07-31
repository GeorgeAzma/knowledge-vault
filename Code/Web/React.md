``` jsx
// rerenders when count is changed via setCount()
const [count, setCount] = useState(0);
<button onClick={() => setCount(count + 1)}>Increment</button>

// like a static mut value, no rerender
const inputRef = useRef(null);
inputRef.current // holds current value
<input ref={inputRef} />
<button onClick={() => inputRef.current.focus()}>Focus Input</button>

// execute when dependency changes, runs after render
// [] runs once on mount (when component renders first time)
useEffect(() => {
  document.title = `Count: ${count}`;
}, [count]);
```
