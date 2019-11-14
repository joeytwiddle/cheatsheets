This has now been published here: https://gist.github.com/joeytwiddle/49ecf347bf97c5a67a8d713dd437efcf

The official version is the Gist version.



# Preamble

I have used WebStorm at work for the past three years.  But last month I used VSCode exclusively for four weeks, because I wanted to learn it.  I noted my observations here.

Eventually, as a deadline approached, I switched back to WebStorm.  Why?  VSCode is very good, and I was impressed.  But I still find WebStorm is slightly better at a few things which I use very frequently.  These small improvements really add up when I'm trying to get stuff done.

In keeping with the Pareto principle, small advantages with only a few commonly used features are enough to make one editor stand out for me.  Specifically, "Go to Definition/References", "Searching" and "Carrying imports" are so important, that just making these more convenient means that all other concerns are irrelevant.

So, for the reader's convenience, these are the first few features I will address below.

The goal of this document is not to disparage either editor, but rather to provide some insight into one developer's way of working, and how the tools may be streamlined.

What I write is entirely subjective, I have not collected any metrics or solid evidence.  So you're mileage may vary.  Still, someone looking to improve these IDEs (or indeed another IDE) may find some starting points here.

Edit: After writing this document, more recently my requirements have changed, and so this month I am using VSCode again!  The main difference is that now I want to have multiple projects open, skip between them, close them and open others.  VSCode provides me with better performance when doing this.  And right now I don't need the streamlined searching and editing features of WebStorm so much.  So, it's still a close race between the two IDEs, depending on the situation.

## Scope

I was mostly working in Javascript, TypeScript and TSX using NodeJS, React and GraphQL.  I was working on a MacBook Pro.




# Go to defintion/references

WebStorm's `Cmd-click` or `Cmd-B` jumps to the definition of what's under the cursor, or (if it is a definition) to the references.  If there is only one reference, it will jump there immediately.  If there are multiple references, it shows a list and lets you choose the one you want to jump to, with arrow keys and `Enter`.

VSCode has a similar feature on `Cmd-click` or `F12` or `Shift-F12`.  Sometimes it will take you straight there.  But quite often it will open up a "peek" panel, and the first result it selects is the definition which you are already on!  After selecting the one you want to jump to, the peek panel stays open, requiring an extra `Escape` to dismiss it.

When there is only one reference, I count six strokes for VSCode, compared to two strokes (`Cmd` and `B`) for WebStorm.

I use the feature of jump to definition and jump to references so often, that any extra keystrokes are undesirable to my workflow.  They slow me down and break my concentration, and make me less likely to use that feature.

There are some other situations where VSCode's jump to definition just doesn't work.  For example, trying to follow a `require()` inside the `webpack.config.js` of a CRNA TypeScript project.

Winner: WebStorm



# Carrying imports between files

When copying and pasting some code between two different files, WebStorm brings the imports along with it, which is amazing!  It can occasionally be annoying (if I subsequently delete some of the pasted code, I may end up with unwanted imports at the top of a file) but overall it's a benefit.

Winner: WebStorm



# Searching

Overall winner: WebStorm

## Find in Files

When starting a file search, VSCode doesn't auto search.  You have to press Enter to actually start searching!  A debounced search after typing would have been good here.  (Surprisingly it does auto search if you change search settings, just not if you type text ... which is the thing you do most often!)

## Presentation of results

VSCode displays results in a two-level tree of filenames and lines of code.  I find this a bit confusing.

By contrast, WebStorm's initial display shows lines of code on the left and filenames on the right.  I find this much easier to scan.  I can either scan the left for code, or the right for filenames, to find what I want.

After searching, sometimes VSCode automatically collapses some results.  I'm not sure why.  I think perhaps when a file contains more than 8 matches or something like that, VSCode folds it.  That is arbitrary and unintuitive.  It's confusing.  I might be expecting to see a file with lots of results but instead it shows none, because they are collapsed!

If a line is commented out, the search results will show everything except the comment.  That is removing information which I think is quite important!  If the line is commented, I want to be able to see that from the results.

## Syntax highlighting of results

WebStorm shows every line of results with (partially complete) syntax highlighting.  This may not seem like a particularly important feature, but once you are accustomed to it, losing that feature can be painful.  Syntax highlighting simply makes it faster to parse the results, and find the ones we are interested in.  E.g. if we know we are looking for the search term only when it appears in a string, then we can scan the results for the string colour.  Similarly, we can easily skip over commented code because its colour is different.

## Where the results appear

In VSCode, the search results appear in the sidebar.  I didn't fancy that.  Fortunately we can use this setting to put the search results in a panel instead:

```js
  "search.location": "panel",
```

In WebStorm, search results appear in a popup window, or a panel below the editor, if we hit `Cmd-Enter`.  There is no option to show them in the sidebar.  But I don't see any need for that anyway.

One advantage of opening in a popup window, with its own file preview, is that we can look through lots of different files without actually affecting the open tabs.  Hitting Escape will take you back to where you were.

By contrast in VSCode, every search result you view is also added to your cursor's history, which can make it more difficult to get back to where you were working.  (Although VSCode does avoid this when using Go to References, by using peek view.)

## Navigating search results

The keys on WebStorm are `Cmd-Opt-Down/Up`.  I find those slightly easier to press than `F4 / Shift-F4` or `Fn-F4 / Fn-Shift-F4` on Mac.

After searching and pressing `F4`, you might still be focused in the search results.  How to get to the actual editor?  `Cmd-Shift-E` twice?!

If you edit one of the search results, the next time you press `F4` it will jump all the way back to the _first search result_, instead of the _next one_ you need to handle!  Awful!

`F4` doesn't always cycle through Search results.  If you have a non-empty Reference results pane, even if you can't see it, `F4` will prefer to cycle those results than the Search you just made.

When selecting a search result with the mouse, I quite often close the result accidentally, because the (x) close icon appears at a dynamic position (just right of the text), and it's invisible until you hover over the line.  This is frustrating UX!

## Search replace

Making a project-wide search replace is pretty smooth in WebStorm.  You can press `Enter` for each search you want to make, or `Down` to skip to the next one.

In VSCode it is similar, except you must press `Cmd-Shift-1` to make the replacement, or `F4` or `Cmd-Delete` to skip to the next one, and sometimes a mouse click is required to focus.  Not so intuitive.

Both editors allow you to remove some results, and then apply all the remaining results at once.

VSCode's diffing view when considering a replacement is pretty advanced (although perhaps overkill for simple text changes).

## Keys to toggle search mode

When focused on the search input, VSCode's keybinds to toggle options (Cmd-Opt-C/W/R for Case sensitivity, Whole words, Regexp) require three keypresses.  It might have been nicer to fit that into two keypresses.

WebStorm only requires two keys, but they are less intuitive (Opt-C/O/X for Case sensitive, whole wOrds, regeXp).

Winner: slightly VSCode I guess

## Other search options

WebStorm offers the ability to search in a specific folder, include or exclude libraries (`node_modules`), or from a number of other predefined "scopes".  The Scope feature is useful for huge projects where sometimes you want to narrow down the focus of a search.

VSCode's options are simpler but still cover the most common use cases: you can filter by filename glob, and toggle `.gitignore` on or off.

Winner: perhaps WebStorm although I rarely use its advanced search options



# Performance and memory usage

WebStorm starts running with a reasonably small profile, but after a few hours it often grows to swallow 2 or 3 GB of RAM.  I have just come to accept that.  In emergencies I will restart WebStorm (without invalidating caches) which takes about half a minute.

VSCode isn't really light on memory either, but it feels significantly snappier in a practical sense.

The real pain point is when I switch back to WebStorm, it sometimes takes a few seconds to come out of swap, a few seconds to notice that the current file has changed, and a few seconds to update the file list in the sidebar.  VSCode manages to do the same things a lot more quickly.

Similarly when opening a project in WebStorm, I am waiting for indexing to finish, whereas in VSCode I feel I can start working sooner.

Regarding indexing, I can "feel" WebStorm scanning the files and rebuilding its index, by which I mean this operation seems to swamp the computer's resources and makes it sluggish to do anything else.  Somehow I don't notice VSCode's scanning at all!  (I am using an early 2015 MacBook.)

Due to WebStorm's occasional poor performance, I tend to prefer VSCode when opening lots of projects at once.  It's just snappier for that.

If you have a high spec machine, then this may not be an important issue.  But if you have a low spec machine, then this may be a decisive factor in which IDE you choose.

Winner: VSCode



# Autocomplete

WebStorm's autocomplete is sometimes more intelligent.  It will prioritise local variables over globals.

But VSCode's autocomplete has a desirable feature which WebStorm lacks.  Often when programming top-down, I will use a variable or function in the code _before_ that variable or function has actually been defined.  When I then go to declare it, VSCode will let me autocomplete the name.  WebStorm doesn't do this, so I have to retype the word again.

Winner: Both great



# WebStorm's helpful context menu

WebStorm offers helpful tools on Opt-Enter.  There is a large variety of these, but here are a few that stand out:

- Would you like to import that?  Why yes, yes I would.  (Although VSCode's import is equally good.)
- Convert to/from template string.  This is helpful.
- Convert to/from arrow function.
- Fix this linter warning (eslint, tslint, jshint, stylelint, or IntelliJ's own hints)
- Disable this linter warning.
- Change the severity of this linter warning.

For imports, VSCode offers them on Ctrl-Space, and this is every bit as good as WebStorm's.  Although one issue is that the dropdown list is somewhat narrow, so when the listed items are particularly long, the differences between them can be hidden from view.

For everything else, VSCode offers "Quick Fix" or "Show Fixes" on `Cmd-.`.  This can perform some similar functions (e.g. "Convert require to import") but it is not quite as comprehensive as WebStorm's.

Winner: WebStorm



# Command Palette

VSCode's Command Palette is very useful for activating rarely used features, and for discovering what is available.

WebStorm doesn't have one.  Although I would use it less often in WebStorm, it wouldn't hurt to have one.

Winner: VSCode



# Navigating tabs

VSCode lets you switch to a tab by number, e.g. `Ctrl-3`.  For WebStorm, you need a plugin to do that.  But neither of them show numbers in the tab titles!  So they are almost useless.

Both offer `Ctrl-Tab ...` to go back to the previously focused tab.  I should probably use this more than I do.

With WebStorm, I moved the editor tabs from the top to the right of the editor, aka Vertical Tabs, and limited them to max 20.  This means none of the tabs ever go off-screen, it's easy to scan down the list, and it's almost possible to guess the number for each tab.  This feature requires a small UI font otherwise it will steal too much screen space.  VSCode's equivalent feature is the Open Editors section of the sidebar.

Winner: No clear winner, both have room for improvement!

If one of these editors would show numbers on the tabs or on the "Open Editors", corresponding to the key I must press to focus that tab, then it would get my approval!

Winner: pros and cons to both

# Navigating

Both IDEs let you navigate backwards, but on Mac VSCode uses `Ctrl-Minus` instead of the platform-wide keybind `Cmd-[` (which they use for de-indentation).  When I change to Linux, I have to switch to using `Ctrl-Alt-Minus` which means yet more context switching.  I will probably need to redefine this!

But I can appreciate that it's difficult to use the platform defaults `Cmd-[` for Mac and `Alt-Left` for Linux, because these would collide with other keystrokes.

Winner: none



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

Winner: WebStorm slightly, but both good

## Indentation

With WebStorm, when I start a new line, more often than not my cursor is at the right indentation, and if I brought any code with me, more often than not that code is also at the right indentation.  It's not perfect, but it beats VSCode's.  Arguably Vim is better at this than VSCode is.

If I close a block e.g. with `}` or `</div>` then WebStorm will automatically reindent the line to suit.

Using a text formatter can help with this.  (I use Prettier.)  In VSCode you hit `Alt-Shift-F`.  In WebStorm I had to define my own key for reformatting with Prettier.

## Changing things

If I have a string wrapped in backticks but I want to replace them with apostrophes, sometimes I naively select the first backtick and then press the apostrophe key, thinking to overwrite it.  WebStorm doesn't.  Instead, it "helpfully" puts two apostrophes around the backtick.  (In fact it will surround any selection of text when you press one of the three quote keys: backtick, apostrophe or quotation marks.)  I wish it wouldn't do this to me.  What I am expected to do is use the context menu.

Winner: VSCode

# Realtime formatting

WebStorm helps you with formatting in realtime, more then VSCode does.  When you start a new line, it sets the correct indentation.  When you paste some new code, it formats it.  (This can be enabled in VSCode too, but I found it would sometimes reformat the entire file, which I don't always want to enable for all files.)

# Intelligent word selection

When you double-click in WebStorm, it will sometimes select words included `-`s and sometimes it will exclude `-`s.  E.g. for CSS properties, class names or animation names, it will select the entire word.  Very user friendly!

# Comments

When you press `Cmd-/` to comment out a line, WebStorm also moves down to the next line.  This makes it easy to comment out two or three lines with a few keystrokes.



# Built in features

WebStorm has a lot of useful features built in.  For VSCode you have to go searching for plugins.  Here are a few examples (with the required VSCode plugin in brackets):

- Code formatting with Prettier (Prettier - Code formatter)
- List todos (Todo Tree)
- Git line annotations (GitLens)
- Highlight or strip trailing spaces (Trailing Spaces)
- Generating JSDocs (Document This)
- ESLint (ESLint)
- Git annotations (GitLens)

Practically speaking, "There's a plugin for that" is not as good as "Toggle this option".  (But it is certainly better than nothing!  And VSCode helps by recommending some plugins, and by having a clear and fast plugin installation process.)

For configuring these features, see settings below.



# Theming

For changing the language syntax highlighting, WebStorm has a very helpful UI.  With VSCode it is more time consuming: I must edit a JSON file, hope I found the right setting, and then hit reload.

VSCode: For errors and warnings you can only choose the colour of the wiggly line under the words.  In WebStorm you can also choose to set a background fill if you like, the foreground text colour, the style of the line, and whether the font is made bold or italic.

Similarly for the current highlighted text, I like to set the background quite bright and the foreground to white.  That removes syntax highlighting, but it makes it very clear exactly which characters have been selected.  (With VSCode you have to keep the background muted so you can read the syntax highlighted text.  A strong background will make the text unreadable!)

Winner: WebStorm and Vim beat VSCode here



# Opening files

WebStorm's `Cmd-Shift-O` remembers your last search when you open it again.  It starts off with the previous search selected, so simply typing will start a new search.  That is useful if you opened the wrong file the first time, or you have multiple related files you want to work on (e.g. you search for `.txt` and want to open three of the results).

VSCode's `Cmd-P` starts with an empty search, so it starts off showing you the MRU.  That is useful, but the MRU is also available on `Ctrl-Tab`, so it's arguably somewhat redundant.

I like that you can repeat VSCode's `Cmd-P Cmd-P ...` and just release `Cmd` when you have found the one you want.  The fingers don't need to move around the keyboard so much.

VSCode: `Cmd-P type part of filename Cmd-P Cmd-P Cmd-P`

WebStorm: `Cmd-Shift-O type part of filename Down Down Down Enter`

WebStorm does offer some additional features from the file selection.  On `Cmd-E` MRU you can toggle between all and changed files.  On `Cmd-Shift-O` you can press it twice to switch between opening Project Files and All Files, which includes those in `node_modules` and ignored folders.  This is useful for inspecting library files or build output.

Winner: both are good, but I do like how WebStorm remembers the last search



# Access to settings

Both products provide good access to the settings, with the `Cmd-,` hotkey and a search feature.  But VSCode's settings are like a flat list, whereas WebStorm's settings are arranged in a classic structured dialog.  This UI makes the settings easier to navigate and understand.

On the other hand, I really enjoy VSCode's Command Palette for discoverability of features.

And VSCode's settings are stored in JSON/JS.  I feel comfortable editing them, leaving comments, and pushing them to source control.  WebStorm's are in XML, which I must sometimes export and import.

Winner: pros and cons for both, but WebStorm's settings UI is easier to use



# Diversity of plugins

Although I don't have a lot of data on this, I get the impression that there are a lot of weird and wonderful plugins for VSCode.  I have seen there is one that helps when working with subtitle files, one for editing SVGs in the editor, and another for working on musical scores.

It also seemed to me, if I remember correctly, that VSCode's GraphQL plugin was more comprehensive than WebStorms.  (Although it doesn't work in all environments.)

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

Not even stylelint was warning me about that.  So occasionally WebStorm catches some things that stylelint does not!



# Coping with errors

If you enable `javascript.implicitProjectConfig.checkJs` in VSCode, you can walk through errors with F8.  When you do so, it displays the error below the focused line, and pushes the later lines down so they are still visible.  This is a bit weird, but I can see the value in it.



# Polish

WebStorm performs a trick to make undo/redo friendlier:  If we are trying to undo/redo some code which is not on the screen, then WebStorm will first jump us to the location of the change.  We will only see the actual change being made when we press the action a second time.  This makes it much clearer what change occurred.  Most editors will make the change, and jump the cursor, leaving the user wondering what the change was.  (In that case the user might undo/redo again, just to see the change happen on screen.)



# UI clutter

Although this hasn't bothered me much, some people have complained that WebStorm appears too cluttered, with various toolbars that they don't need.  But you can in fact hide most toolbars in WebStorm by toggling them from the View > Appearance menu.  However, we cannot have the breadcrumbs toolbar (which I find useful) without also getting the Build Configuration toolbar (with its numerous buttons which I have never once used, preferring npm scripts instead).

Some people also complained WebStorm is ugly, but with the new Material UI theme I don't think that's still true.

Both VSCode and WebStorm can display a lot of information in their Status Bar, which may appear cluttered to some people.  They also offer some interactive buttons there, e.g. to change file type, encoding and indentation.

For those really seeking purity, VSCode offers Zen Mode, which hides all of the UI except the editor.



# Footnotes

## Caveat

Over the last three years I have learned various tricks for WebStorm and installed a few plugins.  So naturally I have a greater capability in WebStorm.  To counter this, I actively went to find equivalent features for the operations I talk about below.  So for the features I criticise, hopefully there isn't an obvious way to do it in VSCode which I simply missed.  When I complain below, it's usually because the VSCode feature was lacking in some way compared to WebStorm's equivalent.

However, I'm sure that if I continued to use VSCode (which I will do at home) I will find some useful tricks and plugins which are not available in WebStorm.  For example, if I want an obscure feature for a rare type of work, it looks more likely that I will find a VSCode plugin for it.

If I have missed a way of doing something in VSCode with the same number of keystrokes as WebStorm, please let me know!

## Keybinds

I complain a couple of times about default keybinds.  Of course I could redefine them.  But I am trying to break the habit of redefining keys, for the following reasons:

- Pair programming
- Helping others to learn keystrokes
- Avoid being incapacitated when using the product out-of-the-box

Also, if the default keystrokes feel bad for me, they may also be bad for others.  So I think it's valid/important to point it out.  We want sane sensible useful defaults!

MacBook users, note that you need to press the `Fn` key if you want to use one of the function keys `F1 - F12`.  Users can reconfigure this, but in exchange they lose the ability to change volume or screen brightness with one keypress.  This is more of a hardware than a software concern, but it has made me less favourable towards function keys.  For this reason, if you are developing an app with a commonly used feature (VSCode devs), I would not recommend putting that feature on a function key!

For a similar reason, and because these days I am using keyboards without PageUp/PageDown, I am much less fond of arrow keys these days.  So now I greatly prefer macOS's `Cmd-Shift-[` to Windows/Linux's `Ctrl-PageUp` or `Fn-Ctrl-Up`.  For common operations, I prefer to keep fingers nearer the home row.
