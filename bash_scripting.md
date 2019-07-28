# XDG standards

## Change your config folder
```bash
export XDG_CONFIG_HOME="$HOME/.test-configs"
```

## Use XDG config folder in a script
```bash
if [ -z "$XDG_CONFIG_HOME" ]; then XDG_CONFIG_HOME="$HOME/.config"; fi
app_config_folder="$XDG_CONFIG_HOME/app_name"
# or
app_config_file="$XDG_CONFIG_HOME/app_name.conf"

if [ -z "$XDG_CACHE_HOME" ]; then XDG_CACHE_HOME="$HOME/.cache"; fi
app_cache_folder="$XDG_CACHE_HOME/app_name"

if [ -z "$XDG_DATA_HOME" ]; then XDG_DATA_HOME="$HOME/.local/share"; fi
app_data_folder="$XDG_DATA_HOME/app_name"
```

Windows NT had a similar convention: https://unix.stackexchange.com/a/313001/33967
