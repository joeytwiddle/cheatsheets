## Gotcha: Your useEffect callback is stuck using old values

```jsx
function Counter() {
  const [count, setCount] = useState(0);
```

The `count` variable will never change.  It can't change because it is a `const`.

It will only appear to change when `Counter()` is called again, and a new scope begins, that gets the latest version of `count`.

Now imagine we want to listen for an external event from the page.  We only want to register our event handler once, on the first call the `Counter`, so we can achieve that with `useEffect`.

```jsx
  useEffect(() => {
    document.addEventListener('message', (msg) => {
      setCount(count + 1);
    });
  });
```

There is a problem.  Because we only set up our event handler on the first render call, it will always see the initial value of `count`.

Even if `Counter` is called many times to re-render the component, our message handler function is still stuck in the first scope, so it never sees the other versions of `count` in later scopes.

### Solution 1: Quick and easy

You may remember this from class components, when we passed a function to `setState` that accepted `prevState` as an argument.

The solution here is similar, except more focused on the exact piece of state we are dealing with.

```jsx
      setCount((prevCount) => prevCount + 1);
```

This way, when we do `prevCount + 1`, we will always have the most recent version of `prevCount`.

This works, but it's a bit of a trick.  What if we really wanted `count` to have the latest value?

### Solution 2: useCallback

We need our code that runs `setCount(count + 1)` to be inside a scope with the latest version of `count`.

We just need to tell `useCallback()` that the callback depends on `count`, by passing `count` in the array of dependencies:

```jsx
  const incrementCounter = useCallback(() => {
    setCount(count + 1);
  }, [count]);

  useEffect(() => {
    window.addEventListener('message', (msg) => {
      incrementCounter();
    });
  }, [incrementCounter]);
```

This time, hooks will do some magic for us.  Whenever we call `incrementCounter`, React will ensure that the latest version of our callback is run.

The `incrementCounter` function will change every time one of its dependencies change.  Above, we listed just one dependency, with `[count]`.  (If `count` doesn't change, then `incrementCounter` also won't change, for efficiency.)

(Of course `incrementCounter` cannot really change, because it is a `const` just like `count` is.  But I think whenever we call `incrementCounter()`, it will interally defer to the latest version of our callback, not the first version.  Magic!)

So this way, when we call `setCount` we will always have the latest value of `count` to work with.

