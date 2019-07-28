
DO NOT EDIT THIS COPY.  THE LATEST VERSION IS ON GIST.GITHUB.COM


## Knowing when to use an arrow function

(Given the choice between arrow function and bind, we usually opt for an arrow function, because it looks cleaner on screen. It might not be ideal for performance or inheritance, but that’s not our priority right now!  You may prefer to talk about bind instead of arrow functions, in your workshop.)

Anyway the short answer to the question is: It’s not about the function itself, it’s about how the other parts of the code _use_ the function.

If they call `this.func()` or `foo.func()` then you don’t need to arrow-or-bind.

But **if they _pass_ the function without calling it**, e.g. `onClick={this.func}` then it needs to be arrowed-or-bound. (Because passing a function like that “loses” the association with `this`. Because Javascript is weird.)


## Putting too much into state

For clarity, I prefer to **keep only the fewest things in state, only those things which might change**.

My colleagues were drawn towards putting other things in state: copying props in there, storing runtime data which could have been derived from the basics.

If a value can be derived from existing state, then I prefer to derive it in the render() function (or in a helper function). Even though that might be less efficient, it keeps the code cleaner.

Optimisation can come last, when the project is mature.


## Performance: Avoid creating **new functions** each time `render()` is called. That can break PureComponents.

```
// Undesirable (gives the button a new function on every render)
<Button onClick={() => this.toggleCheckbox('foo')}>

// Good (always passes the same prop)
<Button onClick={this.toggleFooCheckbox}>

// But yes you might have to declare an extra method in your component
```

Having said that, if it is _difficult_ to do this, then don’t worry too much.  Only do it if it is easy, or you are going to have a lot of these.


## Performance: When displaying lots of items on screen, make those items into **PureComponents**. This will ensure they won’t rerender if their props have not changed. (A simple log in the render function will help to track this.)

If you use redux’s `connect()` then that already does it for you.


## Avoid putting **too many things into one component**.

If a component is handling two concerns, especially two unrelated bits of state for the different concerns, then try to move one of the concerns into a child component.

This avoids unrelated things getting tangled together. One concern per component makes code easier to read and refactor.


## If you find yourself using the **same pattern** in many places, then make a component for it! (This is not really React specific.)

For example, in React (and in Jade, Angular, …) I like to make a button library. Whenever I need an “OK” button or a “Cancel” button, I get it from the library.

Then later, if I want to change how Cancel buttons look, it is really easy to change all of the Cancel buttons at once.

(This doesn’t only apply to small components…)


## Show them how to use `{children}`.  It’s not very hard, but good to know.

This shows that it is easy to create a container component with specific behaviour, but it can contain completely different children whenever it is used.

(So for example, all your forms could have a common look, even though what appears inside the form is quite different.)


## Import the smallest import you can

When possible, do:
```
import foo from 'lib/foo';
```
instead of
```
import { foo } from 'lib';
```

This can help to keep bundle size smaller. If the library also has `bar` and `baz` exports, but you aren’t using them, then the first way will avoid pulling them into the bundle.

(This is somewhat dependent on your webpack config. I don’t know what React Native uses. I guess it’s more of an issue for web than for mobile.)

