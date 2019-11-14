# Start / stop / check a service

```bash
systemctl status sshd.service
systemctl start sshd.service
systemctl stop sshd.service
```

# Make a service start (or not start) on boot

```bash
systemctl enable sshd.service
systemctl disable sshd.service
```

# Edit a service

```bash
vi /usr/lib/systemd/system/sshd.service
```
