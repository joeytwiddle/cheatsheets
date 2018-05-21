https://github.com/yannickcr/eslint-plugin-react/issues/491#issuecomment-196756317

```js
const foo = (a, b) => (
  <View>
    <BigComponent data={a} />
    <BigComponent data={b} />
  </View>
)
```

You might think that foo will not be called if `a` and `b` remain the same.

However [for reasons of performance]() this is not applied by default.

But it looks like [you can apply it when you need it](https://github.com/facebook/react/issues/5677#issuecomment-241265146).

