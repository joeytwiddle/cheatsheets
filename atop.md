# Startup

When `atop` starts, I like to hit `c A t` to:

- `c` - Show full commandlines
- `A` - Sort automatically by most-used resource (memory, CPU, disk-io)
- `t` - Update the view immediately

# Reading log history

Open today's logfile:

    atop -r

or open yesterday's logfile:

    atop -r y

or open the day before yesterday's logfile:

    atop -r yy

or open a specific date:

    cd /var/log/atop
    atop -r atop_20130927

Then jump forwards and backwards in time with <kbd>t</kbd> and <kbd>T</kbd> respectively.

Use <kbd>b</kbd> then `16:20` to jump to a specific time.

Hit `?` to bring up the help.

# Sorting processes

    C – sort in order of cpu consumption (default)
    M – sort in order of memory usage
    D – sort in order of disk activity
    N – sort in order of network activity
    A – sort in order of most active resource (auto mode)

The `A` sorting is great for drawing attention to the current bottleneck.  An `A` will appear next to the column which it has chosen.

# Showing process info

These keys change what data is displayed for each process:

    g - generic (default)
    c - full command line (helps to differentiate different instances of the same executable)
    m - memory
    d - disk
    n - network
    s - scheduling
    v - various
    e - GPU usage

# Showing other info

Instead of processes, you can display:

    u - accumulate process data by user
    u - accumulate process data by process name
    j - accumulate process data by docker container
    y - break process into individual threads
    Y - sort the threads in y view

You can also hit:

    t - make a sample immediately and display it
        (this can be useful to skip the startup screen)



# Sources

- https://haydenjames.io/use-atop-linux-server-performance-analysis/
