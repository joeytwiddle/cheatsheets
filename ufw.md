# UFW - Uncomplicated Firewall

sudo pacman -S ufw

sudo systemctl enable ufw.service

sudo ufw enable

sudo ufw status
sudo ufw status verbose

sudo ufw allow 22
# Or more explicitly
sudo ufw allow 22/tcp
# Drop packets
sudo ufw deny 22
# Alternatively, let the sender know that their traffic was denied
sudo ufw reject 22
# To remove the rule, repeat the rule with "delete" argument added
sudo ufw delete reject 22

# Rate limiting
sudo ufw limit ssh/tcp

