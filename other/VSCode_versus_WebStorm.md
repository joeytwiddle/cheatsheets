# Preamble

I have used WebStorm at work for the past three years.  But last month I used VSCode exclusively for four weeks.  I noted my observations here.

Eventually, as a deadline approached, I switched back to WebStorm.  VSCode is very good.  I was impressed.  But I still find WebStorm is slightly better at a few things which I use very frequently.  These small improvements really add up when I'm trying to get stuff done.

In keeping with the Pareto principle, small advantages with only a few commonly used features are enough to make one editor stand out for me.  Specifically, "Go to Definition/References", "Searching" and "Carrying imports" are so important, that just making these more convenient means that all other concerns are irrelevant.

So, for the reader's convenience, these are the first few features I address below.

The goal of this document is not to disparage either editor, but rather to provide some insight into one developer's way of working, and how the tools may be streamlined.

## Caveat

Over the last three years I have learned various tricks for WebStorm and installed a few plugins.  So naturally I have a greater capability in WebStorm.  To counter this, I actively went to find equivalent features for the operations I talk about below.  So for the features I criticise, hopefully there isn't an obvious way to do it in VSCode which I simply missed.  When I complain below, it's usually because the VSCode feature was lacking in some way compared to WebStorm's equivalent.

However, I'm sure that if I continued to use VSCode (which I will do at home) I will find some useful tricks and plugins which are not available in WebStorm.  If I want an obscure feature for a rare type of work, I think there is a greater chance I will find a VSCode plugin for it.

And of course, if I have missed that there is a way to do something in VSCode with the same number of keystrokes as WebStorm, please let me know!

## Keybinds

I complain a couple of times about default keybinds below.  Of course I could redefine them, but I wanted to learn the defaults so that I could share what I learned with other users.  Defaults are important because they are universal, and the majority of users won't redefine them.  Again, for highly frequent operations, a good keybind can make a large difference.

Some MacBook users need to press the `Fn` key if they want to use one of the function keys `F1 - F12`.  Users can reconfigure this, but in exchange they lose the ability to change volume or screen brightness with one keypress.  This is more of a hardware than a software concern, but it has made me less favourable towards function keys.  For this reason, if you are developing an app with a commonly used feature, I would not recommend putting that feature on a function key!

## Scope

I was mostly working in Javascript, TypeScript and TSX using NodeJS, React and GraphQL.  I was working on a MacBook Pro.




# Go to defintion/references

WebStorm's `Cmd-click` or `Cmd-B` jumps to the definition of what's under the cursor, or (if it is a definition) to the references.  If there is only one reference, it will jump there immediately.  If there are multiple references, it shows a list and lets you choose the one you want to jump to, with arrow keys and `Enter`.

VSCode has a similar feature on `Cmd-click` or `F12` or `Shift-F12`.  Sometimes it will take you straight there.  But quite often it will open up a "peek" panel, and the first result it selects is the definition which you are already on!  After selecting the one you want to jump to, the peek panel stays open, requiring an extra `Escape` to dismiss it.

When there is only one reference, I count six strokes for VSCode, compared to two strokes (`Cmd` and `B`) for WebStorm.

I use the feature of jump to definition and jump to references so often, that any extra keystrokes are undesirable to my workflow.

Winner: WebStorm



# Carrying imports between files

When copying and pasting some code between two different files, WebStorm brings the imports along with it, which is amazing!  It can occasionally be annoying (if I subsequently delete some of the pasted code, I may end up with unwanted imports at the top of a file) but overall it's a benefit.

Winner: WebStorm



# Searching

Overall winner: WebStorm

## Find in Files

When starting a file search, VSCode doesn't auto search.  You have to press Enter!  (Although weirdly it does auto search if you change search settings, just not if you type text ... which is the thing you do most often!)

VSCode displays results in a two-level tree of filenames and lines of code.  I find this a bit confusing.

By contrast, WebStorm's initial display shows lines of code on the left and filenames on the right.  I find this much easier to scan.  I can either scan the left for code, or the right for filenames, to find what I want.

After searching, VSCode automatically collapses some results.  I think when a file contains more than 8 matches or something like that, VSCode folds it.  That is arbitrary and unintuitive.  It's confusing.  The file I expect to show lots of results is not showing any results!

## Where the results appear

In VSCode, the search results appear in the sidebar.  I didn't fancy that.  Fortunately we can use this setting to put the search results in a panel instead:

```js
  "search.location": "panel",
```

In WebStorm, search results appear in a popup window, or a panel below the editor, if we hit `Cmd-Enter`.  There is no option to show them in the sidebar.  But I don't see any need for that anyway.

One advantage of opening in a popup window, with its own file preview, is that we can look through lots of different files without actually affecting the open tabs.

By contrast in VSCode, every search result you view is also added to your cursor's history, which is not particularly helpful.  (VSCode does avoid this when using Go to References, by using peek view.)

(In Eclipse you can have any panel appear anywhere you wanted!)

## Navigating search results

The keys on WebStorm are `Cmd-Opt-Down/Up`.  I find those slightly easier to press than `F4 / Shift-F4` or `Fn-F4 / Fn-Shift-F4` on Mac.

After searching and pressing `F4`, you might still be focused in the search results.  How to get to the actual editor?  `Cmd-Shift-E` twice?!

If you edit one of the search results, the next time you press `F4` it will jump all the way back to the _first search result_, instead of the _next one_ you need to handle!  Awful!

`F4` doesn't always cycle through Search results.  If you have a non-empty Reference results pane, even if you can't see it, `F4` will prefer to cycle those results than the Search you just made.

When selecting a search result with the mouse, I quite often close the result accidentally, because the (x) close icon appears right next to the text, but it only appears on hover.

## Search replace

Making a project-wide search replace is pretty smooth in WebStorm.  You can press `Enter` for each search you want to make, or `Down` to skip to the next one.

In VSCode it is similar, except you must press `Cmd-Shift-1` to make the replacement.  Not so intuitive.

Both editors allow you to remove some results, and then apply all the remaining results at once.

## Keys to toggle search mode

When focused on the search input, VSCode's keybinds to toggle options (Cmd-Opt-C/W/R for case sensitivity, whole words, regexp) require three keypresses.  Surely we can find some way to fit that into two keypresses should be enough.

On the other hand, VSCode's keypresses make more sense whereas WebStorm's are less intuitive (Opt-C/O/X for Case sensitive, wOrd regeXp).

WebStorm also has an outstanding bug that it won't show the keyboard shortcut on hover, or when holding Opt, so it's harder to discover the shortcuts.

Winner: slightly VSCode I guess



# Autocomplete

WebStorm's autocomplete is sometimes more intelligent.  It will prioritise local variables over globals.

But VSCode's autocomplete has a desirable feature which WebStorm lacks.  Often when programming top-down, I will use a variable or function in the code _before_ that variable or function has actually been defined.  When I then go to declare it, VSCode will let me autocomplete the name.  WebStorm doesn't do this, so I have to retype the word again.

Winner: Both great



# WebStorm's helpful context menu

WebStorm offers helpful tools on Opt-Enter.  There are a huge variety of these, but here are a few that stand out:

- Would you like to import that?  Why yes, yes I would.  (Although VSCode's import is equally good.)
- Convert to template string.  This is helpful.
- Fix this linter warning (eslint, tslint, jshint, stylelint, or IntelliJ's own hints)
- Disable this linter warning.
- Change the severity of this linter warning.

For imports, VSCode offers them on Ctrl-Space, and this is every bit as good as WebStorm's.  Although one issue is that the dropdown list is somewhat narrow, so when the listed items are particularly long, the differences between them can be hidden from view.

For everything else, VSCode offers "Quick Fix".  This can perform some similar functions (e.g. "Convert require to import") but it is nowhere near as comprehensive as WebStorm's.

Winner: WebStorm



# Memory usage

WebStorm starts running with a reasonably small profile, but after a few hours it often grows to swallow 2 or 3 GB of RAM.  I have just come to accept that, or in emergencies I will restart it (without invalidating caches).

VSCode isn't really light on memory either, but it seems to be a bit better in this regard.

Winner: VSCode



# Command Palette

VSCode's Command Palette is very useful for activating rarely used features, and for discovering what is available.

WebStorm doesn't have one.  Although I would use it less often in WebStorm, it wouldn't hurt to have one.

Winner: VSCode



# Navigating tabs

VSCode lets you switch to a tab by number, e.g. `Ctrl-3`.  For WebStorm, you need a plugin to do that.  But neither of them show numbers in the tab titles!  So they are almost useless.

I like that you can repeat VSCode's `Cmd-P Cmd-P ...`

Both offer `Ctrl-Tab ...` to go back to the previously focused tab.  I should probably use this more than I do.

Both let you navigate backwards, although VSCode uses `Ctrl-Minus` instead of the platform-wide keybind `Cmd-[` (which they use for de-indentation).  Extra annoying, when I switch to Linux, I have to swtich to using `Ctrl-Alt-Minus`.  I will probably need to redefine this.

With WebStorm, I moved the editor tabs from the top to the right of the editor, aka Vertical Tabs, and limited them to max 20.  This means none of the tabs ever go off-screen, it's easy to scan down the list, and it's almost possible to guess the number for each tab.  This feature requires a small UI font otherwise it will steal too much screen space.  VSCode's equivalent feature is the Open Editors section of the sidebar.

Winner: No clear winner, both have room for improvement!

If one of these editors could show numbers on the tabs or on the "Open Editors", corresponding to the key I must press to focus that tab, then it would get my approval.



# Editing text

## HTML/TSX

When I write `<div>|` VSCode actually produces `<div>|</div>`.  That isn't as helpful as you might think, because quite often I'm trying to wrap some existing content.  I have to cut the closing tag and move it to where I want it!

WebStorm doesn't add the closing tag for me.  But later when I type `</` it closes the tag for me, i.e. it writes `</div>`.  That is super easy and efficient.

Note: Actually WebStorm will immediately add a closing tag, but only when the cursor is inside text content, not when it is between other tags.  That heuristic does seem to match what I usually want to do.

Huge: When I rename a tag (e.g. changing `div` to `span`) WebStorm changes both ends of the tag at once.  With VSCode I have to change both the opening and closing tags myself.

In WebStorm, when I write a JSX attribute, it opens `{...}`s for me.  That would be useful, except our junior devs don't delete it when they are writing plain strings, so we end up with:
```jsx
<Component foo={'bar'} />
when we should have
<Component foo="bar" />
```
I haven't found a linter to clean it up yet.  I can probably turn off the feature for myself, but I'm not sure if I can turn it off for the whole team!

Winner: WebStorm, slightly

## Indentation

With WebStorm, when I start a new line, more often than not my cursor is at the right indentation, and if I brought any code with me, more often than not that code is also at the right indentation.  It's not perfect, but it beats VSCode's.  Arguably Vim is better at this than VSCode is.

If I close a block e.g. with `}` or `</div>` then WebStorm will automatically reindent the line to suit.

## Changing things

If I have a string wrapped in backticks but I want to replace them with apostrophes, sometimes I naively select the first backtick and then press the apostrophe key, thinking to overwrite it.  WebStorm doesn't.  Instead, it "helpfully" puts two apostrophes around the backtick.  (In fact it will surround any selection of text when you press one of the three quote keys: backtick, apostrophe or quotation marks.)  I wish it wouldn't do this to me.  What I am expected to do is use the context menu.

Winner: VSCode

# Realtime formatting

WebStorm helps you with formatting in realtime, more then VSCode does.  When you start a new line, it sets the correct indentation.  When you paste some new code, it formats it.  (This can be enabled in VSCode too, but I found it would sometimes reformat the entire file, and sometimes do it wrong!)



# Built in features

WebStorm has a lot of useful features built in.  For VSCode you have to go searching for plugins.  Here are a few examples (with the required VSCode plugin in brackets):

- Code formatting with Prettier
- List todos (Todo Tree)
- Git line annotations (GitLens)
- Highlight or strip trailing spaces (Trailing Spaces)

Practically speaking, "There's a plugin for that" is not as good as "Toggle this option".  (But it is certainly better than nothing!)



# Theming

For changing the language syntax highlighting, WebStorm has a very helpful UI.  With VSCode it is more time consuming: I must edit a JSON file, hope I found the right setting, and then hit reload.

VSCode: For errors and warnings you can only choose the colour of the wiggly line under the words.  In WebStorm you can also choose to set a background fill if you like, the foreground text colour, the style of the line, and whether the font is made bold or italic.

Similarly for the current highlighted text, I like to set the background quite bright and the foreground to white.  That removes syntax highlighting, but it makes it very clear exactly which characters have been selected.  (With VSCode you have to keep the background muted so you can read the syntax highlighted text.  A strong background will make the text unreadable!)

Winner: WebStorm and Vim beat VSCode here



# Opening files

WebStorm's `Cmd-Shift-O` remembers your last search when you open it again.  It starts off with the previous search selected, so simply typing will start a new search.  That is useful if you opened the wrong file the first time, or you have multiple related files you want to work on (e.g. you search for `.txt` and want to open three of the results).

VSCode's `Cmd-P` starts with an empty search, so it starts off showing you the MRU.  That is useful, but that is also available on `Ctrl-Tab`, so it's arguably somewhat redundant.

Winner: both are good, but I do like how WebStorm remembers the last search



# Access to settings

Both products provide good access to the settings, with the `Cmd-,` hotkey and a search feature.  But VSCode's settings are like a flat list, whereas WebStorm's settings are arranged in a classic structured dialog.  This UI makes the settings easier to navigate and understand.

On the other hand, I really enjoy VSCode's Command Palette for discoverability of features.

VSCode's settings are stored in JSON/JS.  I feel comfortable editing them, leaving comments, and pushing them to source control.  WebStorm's are in XML, which I must sometimes export and import.

Winner: pros and cons for both, but WebStorm's settings UI is easier to use



# Diversity of plugins

Although I don't have a lot of data on this, I get the impression that there are a lot of weird and wonderful plugins for VSCode.  I have heard there is one that helps when working with subtitle files, and another for working on musical scores.

Winner: VSCode (probably)


# Open source

One big plus for VSCode is that it is free software.  As such, if something really bothers me enough, I can fix it myself!  This is not an option with WebStorm.  The most I can do is open a ticket on their bug tracker.

Winner: VSCode



# Invalid CSS warnings

This is a bit niche, but I notice that WebStorm correctly warned about:

```
  align-items: left;
  /* because that should instead be */
  align-items: flex-start;
```

Not even stylelint was warning me about that!

So occasionally WebStorm catches some things that stylelint does not!



# Coping with errors

If you enable `javascript.implicitProjectConfig.checkJs` in VSCode, you can walk through errors with F8.  When you do so, it displays the error below the focused line, and pushes the later lines down so they are still visible.  This is a bit weird, but I can see the value in it.



# UI clutter

Although this hasn't bothered me much, some people have complained that WebStorm appears too cluttered, with various toolbars that they don't need.  Well I found that you can hide most toolbars in WebStorm by toggling them from the View menu.  But there is still some room for criticism: It seems I cannot enjoy the breadcrumbs toolbar (which I find useful) without also getting the Build Configuration toolbar with its numerous buttons (which I have never once used, preferring npm scripts instead).

VSCode doesn't have so many toolbars to complain about, but its Status Bar can get quite busy.  (WebStorm's Status Bar is also quite busy, but it does provide some interactive features like setting tab width and encoding for the current file.)

For those really seeking purity, VSCode offers Zen Mode, which hides all of the UI except the editor.

Some people also complained WebStorm is ugly, but with the new Material UI theme I don't think that's still true.  Personally, I stuck with my old grey theme, for the familiarity.



# Intelligent word selection

When you double-click in WebStorm, it will sometimes select words included `-`s and sometimes it will exclude `-`s.  E.g. for CSS properties, class names or animation names, it will select the entire word.



# Footnotes

"You can redefine the keys" is off the table for me right now.  I am trying to break the habit of redefining keys, for a couple of reasons:

- Pair programming
- Helping others to learn keystrokes
- Avoid being incapacitated when using the product off-the-shelf

Also, if the default keystrokes feel bad for me, they may also be bad for others.  So I think it's valid/important to point it out.
