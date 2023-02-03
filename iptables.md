# IPTables

## Monitoring

You can watch which rules are getting traffic using this command:

```sh
watch -d --interval=2 'iptables -nvL | grep -v "^ *0  *0 "'
```

## With docker

When Docker restarts, it reconfigures iptables, and can then accept traffic which iptables would have originally blocked.  That means you cannot protect your docker ports with usual iptables rules.

Full explanation: https://docs.docker.com/network/iptables/

Solution: For incoming packets, you need to put your filter rules on the `DOCKER-USER` chain, and you also need to specify your external interface for those rules (otherwise the rules may get applied to other traffic, e.g. outgoing traffic).

For example:

```sh
ext_if='eth0'

# Clear the docker chain
/sbin/iptables -F DOCKER-USER

# Open this specific port to the public
/sbin/iptables -A DOCKER-USER -i "$ext_if" -p tcp -m tcp --dport 8080 -j ACCEPT

# Reject anything else
/sbin/iptables -A DOCKER-USER -i "$ext_if" -j DROP
```

