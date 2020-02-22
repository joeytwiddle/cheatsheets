# Break out of a frozen ssh session

Press `<Enter> ~ .`

If it doesn't work, try again with an `<Escape>` in front).

# Set up a public/private key pair so you can log in without a password

If you don't already have `~/.ssh/id_rsa` you can generate one:

```sh
ssh-keygen -t rsa -f ~/.ssh/id_rsa
```

It's up to you whether you want to use a passphrase.

Now we need to tell the remote machine to trust you.  We will give it your public key.  Then anyone with your private key will be able to log in.

1. Display your public key:

    ```sh
    cat ~/.ssh/id_rsa.pub
    ```

    You may copy this into your clipboard.

2. Open a shell in the remote machine (if you don't already have one):

    ```sh
    ssh <user>@<remote_host>
    ```

3. Add your public key to the file `~/.ssh/authorized_keys`:

    ```sh
    mkdir -p ~/.ssh
    echo "<paste_public_key>" >> ~/.ssh/authorized_keys
    ```

That's it.  Now the next time you try to `ssh <user>@<remote_host>` it should use your key, so you won't need the user's password.

## Using a different key file

If you use a different filename, e.g. `~/.ssh/my_other_identity_rsa.pub` then you must specify this when logging in:

```sh
ssh -i ~/.ssh/my_other_identity_rsa <user>@<remote_host>
```
