Q: Should I store `foo` in the React Component’s state or in the Redux store?

A: For global (shared) app state, ideally use the Redux store. For re-usable components, use the component’s own state. When in doubt, do whatever is less awkward.

https://github.com/reactjs/redux/issues/1287#issuecomment-175351978
