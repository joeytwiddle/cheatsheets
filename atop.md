# Reading log history

Open today's logfile:

    atop -r

or open yesterday's logfile:

    atop -r y

or open the day before yesterday's logfile:

    atop -r yy

Then jump forwards and backwards in time with <kbd>t</kbd> and <kbd>T</kbd> respectively.

Use <kbd>b</kbd> then `16:20` to jump to a specific time.


# Sorting processes

    C – sort in order of cpu consumption (default)
    M – sort in order of memory usage
    D – sort in order of disk activity
    N – sort in order of network activity
    A – sort in order of most active resource (auto mode)


# Sources

- https://haydenjames.io/use-atop-linux-server-performance-analysis/
