# TypeScript watcher FD fix (macOS)

`tsserver`/`tsc` default to watching each file with its own open file handle
(`UseFsEvents`). In a big monorepo with many worktrees this can hold thousands of
handles per process and exhaust the system-wide file-descriptor limit
(`kern.maxfiles`), surfacing as `ENFILE: too many open files in system`.

Fix: switch the watch strategy to `UseFsEventsOnParentDirectory` — watch each
file's parent directory instead of the file, collapsing thousands of file handles
into a handful of directory handles. Set via the `TSC_WATCHFILE` env var, which
both `tsc` and `tsserver` read from TypeScript's shared `sys` layer.

The catch: env vars only reach processes that inherit them. Terminal-launched
tools inherit the shell; GUI editors (Cursor/VS Code launched from the Dock) do
not — they need `launchctl setenv`. So both steps below are required.

## 1. Shell-launched processes (CLI tsc, vite, tests)

`.zprofile` already contains (synced via dotfiles):

```sh
export TSC_WATCHFILE=UseFsEventsOnParentDirectory
```

## 2. GUI editors (Cursor / VS Code tsserver)

```sh
# Apply now (resets on reboot):
launchctl setenv TSC_WATCHFILE UseFsEventsOnParentDirectory

# Persist across reboots — create the LaunchAgent:
cat > ~/Library/LaunchAgents/com.user.tsc-watchfile.plist <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.user.tsc-watchfile</string>
  <key>ProgramArguments</key>
  <array>
    <string>/bin/launchctl</string>
    <string>setenv</string>
    <string>TSC_WATCHFILE</string>
    <string>UseFsEventsOnParentDirectory</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
PLIST

launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.user.tsc-watchfile.plist
```

## Verify

```sh
launchctl getenv TSC_WATCHFILE            # -> UseFsEventsOnParentDirectory
lsof -p "$(pgrep -f tsserver | head -1)" | awk '{print $5}' | sort | uniq -c | sort -rn | head
#   REG (regular-file handle) count should be in the tens, not thousands
```

Then restart the editor's TS server (Cmd+Shift+P -> "TypeScript: Restart TS Server")
or relaunch the editor so tsserver picks up the new env.

## Notes

- The env var only sets the watch *strategy*; there's no env equivalent of
  `excludeDirectories`, so `node_modules` is still watched — but cheaply, as
  parent-directory handles. For finer control use `watchOptions` in `tsconfig.json`
  or `typescript.tsserver.watchOptions` in editor settings.
- Remove with: `launchctl bootout gui/$(id -u)/com.user.tsc-watchfile`,
  delete the plist, and drop the `.zprofile` line.
