## Some common issues

### Username in crontab

The certbot documentation recommends putting this in `/etc/cron.d/certbot`:

```crontab
0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && /usr/local/bin/certbot-auto renew
```

But sometimes I prefer to put it into root's `crontab -e` instead.  If you do this, then be sure to remove the `root` argument!  The cron table has a slightly different format for users.  It won't work if you keep the username.

### Add the PATH if necessary

On some machines certbot could not find python when it ran from the cronjob.  To fix that, I had to provide the PATH in the cronjob.

For example, on one machine I was getting this error:

```
Could not choose appropriate plugin: The nginx plugin is not working; there may be problems with your existing configuration.
The error was: NoInstallationError("Could not find a usable 'nginx' binary. Ensure nginx exists, the binary is executable, and your PATH is set correctly.",)
```

Apparently this was because `/usr/sbin` was not on the PATH.  So the solution was to put this just above the certbot line in the crontab:

```crontab
PATH=/usr/sbin:/usr/bin
```

An alternative solution might be to use bash to setup the shell like this:

```
... && bash --login -c "/usr/local/bin/certbot-auto ... renew" ...
```

## Testing your certbot is working

Sometimes cerbot won't work as intended, but you won't find out until three months later (when it actually tries to renew)!

We may want to test it sooner.  We can run a test ourselves.  We will test inside the cronjob, because that is the environment where certbot needs to work.

Copy the current cron line and modify it:

1. Add `--dry-run` and `--test-cert` (don't actually change anything, and use LetsEncrypt's testing/staging servers to avoid getting blocked or rate-limited).

2. Reduce the cronjob interval, so you won't have to wait 12 hours for it to run.

3. Reduce python's random sleep.  (But we keep the sleep so we are still testing that part.)  Note that certbot will itself take a small pause when it runs.

4. Optionally add brackets and pipe all output to a logfile, in case you aren't receiving email on this machine.

So the lines will end up looking something like this:

```crontab
# Normal certbot update
0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && /usr/local/bin/certbot-auto renew

# Our test
*/5 * * * * ( python -c 'import random; import time; time.sleep(random.random() * 5)' && /usr/local/bin/certbot-auto --dry-run --test-cert renew ) >> /tmp/certbot_cronjob.log 2>&1
```

Now see if the process is working, by checking your email, or watching the logfile:

```bash
tail -F /tmp/certbot_cronjob.log
```

Look out for any error messages.  Once you have seen a successful run, you can remove or comment out the test line.

