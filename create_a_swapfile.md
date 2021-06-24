As root, run the following:

```sh
dd if=/dev/zero of=/swapfile1 bs=1MiB count=2048 
chmod 0600 /swapfile1
mkswap /swapfile1
swapon /swapfile1

echo "/swapfile1              none     swap   sw                      0 0" >> /etc/fstab
```

