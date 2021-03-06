# React

This file only lists one gotcha.  For a more complete list, see: https://gist.github.com/joeytwiddle/8634b729a50b816762f78aa545fbd72f

## this.setState() is asynchronous

TLDR: Do not refer to `this.state` when calling `this.setState()`.  Pass a function to setState instead.

It is fine to update state with a small merge:

    this.setState({ foo: 2 })
    this.setState({ bar: 7 })

but if you need to refer to the current state, then be careful:

    // Avoid this form
    this.setState({ foo: this.state.foo * 2 })

One change like this will work, but if you make two updates within one cycle, you may encounter problems.  Because setState does not apply your merges immediately.  It waits and applies them later.

    // BAD
    // The second and third calls will still be using the OLD state!
    this.setState({ foo: this.state.foo * 4 })
    this.setState({ foo: this.state.foo / 2 })
    this.setState({ bar: this.state.foo + 5 })

In the example above, the first change to foo gets completely discarded.  `this.state` will not change until some point in the future, when React decides to apply your state changes.

In order to handle the asynchronous nature of setState, we can provide it with a function argument.  The function will accept the current state, and return a merge.

    // GOOD
    // All calls will be applied to the state in turn
    this.setState(state => ({ foo: state.foo * 4 }))
    this.setState(state => ({ foo: state.foo / 2 }))
    this.setState(state => ({ bar: state.foo + 5 }))

With a starting state of `{foo: 1}` we will end with state `{foo: 2, bar: 7}` as desired.


