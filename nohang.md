# Nohang

Nohang is one of many solutions to Linux's inadequate oom-killer. Its job is to cleanly terminate a runaway process before the system grinds to a halt, and the oom-killer eventually forcibly kills it anyway.

Homepage here: https://github.com/hakavlad/nohang

Their README also lists alternatives: https://github.com/hakavlad/nohang#solution

## Installation (instructions for CentOS)

1. `yum install nohang python3`

2. The defaults are not bad (certainly better than nothing) but you may want to tweak them according to the needs of your system. See the [Configuration](#Configuration) section below.

3. Start the service, now and forever

   `systemctl enable --now nohang`

## Configuration

Edit the config file in `/etc/nohang/nohang.conf`

This is optional, but I recommend disabling the `print_statistics` option, because its output can be [confusing](https://github.com/hakavlad/nohang/issues/128).

### Sensitive processes

`nohang` will initially send a `TERM` signal, but after 10 seconds, if memory is still low, it will send a `KILL` signal. This can be problematic for sensitive services that cannot easily recover from being killed (e.g. blockchain nodes).

To reduce the need for the `KILL` signal, we can give the process more time to terminate itself, or we can start the termination earlier:

- Increase `max_soft_exit_time` from `10` seconds to `240` seconds (4 minutes) to give the process time to cleanly terminate itself.

- If it does not have enough memory to cleanly terminate (and is still getting killed), then increase `soft_threshold_min_mem` from `5` to `10`, to initiate the termination early, while there is still memory available.

### Automatic configuration

If you want to automate the suggested configuration:

```bash
sed -i /etc/nohang/nohang.conf '
  s/^print_statistics = .*/print_statistics = False/
  s/^max_soft_exit_time = .*/max_soft_exit_time = 240/
  s/^soft_threshold_min_mem = .*/soft_threshold_min_mem = 10 %/
'
```

## Monitoring

To see the most recent times nohang took action:

```
journalctl -u nohang -n 2000 | grep -B20 'Sending .* victim'
```

This will ignore lines produced by `print_statistics`
