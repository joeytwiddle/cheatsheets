# What we discovered about setState today

When calling `this.setState()`, we should never refer to `this.state`.

Why?  Because the state update we pass will be applied later, asynchronously.  By that time, `this.state` might have changed, but our update was based on the old copy of `this.state`!

    // BAD
    this.setState({ counter: this.state.counter + 1 })

    // GOOD (can be safely applied asnchronously)
    this.setState((previousState) => ({ counter: previousState.counter + 1 }))

But, if you are just clobbering a property, without updating it or worrying about previous states, you can just do:

    this.setState({ counter: 0 })

Short read: https://medium.com/@wereHamster/beware-react-setstate-is-asynchronous-ce87ef1a9cf3

Long read: https://medium.freecodecamp.org/functional-setstate-is-the-future-of-react-374f30401b6b
