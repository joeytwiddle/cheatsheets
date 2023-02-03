## nethogs

My favourite is nethogs, although sadly it is not available in the standard packages repos of all distros.

```bash
# Capture both TCP and UDP (default is just TCP, I think)
nethogs -C

# -v show cumulative I/O (total for each process)
nethogs -v 3
```

You can press `m` while `nethogs` is running, to cycle the units.

Both `nethogs` and `iftop` accept the `-t` option for plain text output (rather than clearing the screen and formatting), which may be better for logging or parsing.

## iftop

I prefer using `nethogs` over `iftop` when possible, because `iftop` does not show the relevant processes, it is confusing to read the in and out on separate lines, and it is difficult/impossible to see cumulative totals for each process/port.

```bash
iftop

# Show ports, do not resolve port services, do not resolve hostnames
iftop -P -N -n

# Reduce the max width of the bars (useful if the bars are too small for you to compare)
iftop -m 350k

# Display packet counts rather than data size (useful when debugging a DDOS)
iftop -u packets -m 3k

# I thought this might (using a temporary config file) show cumulative data, or at least let us toggle the totals at the bottom of the display, but I haven't got it to do anything yet
iftop -c <( echo "show-totals: yes" )
```

## iftraf-ng

```bash
# Informative, but sends too much text over the terminal.  This is not ideal in a low-bandwidth situation!
iftraf-ng
```

## ss

```bash
# Very basic: Count the number of active connections
ss -tan state syn-recv | wc -l
```

## See also

This WILL NOT help you to monitor network I/O, because it monitors disk I/O.

```bash
# Show cumulative I/O
iotop -a
```

