# Firefox Cheatsheet

## How to customise Firefox UI

Get started with [these instructions](https://www.reddit.com/r/FirefoxCSS/comments/73dvty/tutorial_how_to_create_and_livedebug_userchromecss/)

Browse some themes for inspiration: https://firefoxcss-store.github.io/

Grab snippets of code from these recipes: https://github.com/Timvde/UserChrome-Tweaks

Get more advice here: https://www.userchrome.org/

## How to restart crashed extensions

1. In `about:config` ensure that `devtools.chrome.enabled` is `true`

2. Open the Browser Console (**not** DevTools) with Ctrl-Shift-J on Windows/Linux

3. Run the following code:

```js
AddonManager.getActiveAddons().then(({addons}) => {
  for (let addon of addons) {
    if (addon.type === "extension" && addon.isSystem === false && addon.hidden === false) addon.reload();
  }
});
```

Source: https://www.reddit.com/r/firefox/comments/wqneq9/comment/iko4bl4/

