# Install docker
```bash
yum install docker
```

# Get docker running
```bash
systemctl enable docker
systemctl start docker
```

# Test docker
```bash
docker run hello-world
```

# List downloaded images (these take disk space)
```bash
docker image ls
# or just
docker images
```

# List containers (including stopped containers)
```bash
docker container ls --all
# or just
docker ps -a
```

Add `--size` to see how much space each container is taking.

# Remove a container
```bash
docker container rm <container_id>
```

# Remove an image
```bash
docker image rm <image_id>
```

# Build a Docker image

After creating a Dockerfile, you can build an image like this:

```bash
docker build --tag=myapp .
# or
docker build --tag=myapp:v0.0.1 .
```

# If you have a problem resolving DNS

For example:

>   Temporary failure resolving 'security.debian.org'

Quick fix:

```bash
docker build --network=host ...
docker run --network=host ...
```

Permanent fix:

```bash
cat >> /etc/docker/daemon.json << !
{
  "dns": ["1.1.1.1", "8.8.8.8"]
}
!

service docker restart
```

[Source 1](https://docs.docker.com/get-started/part2/), [Source 2](https://medium.com/@faithfulanere/solved-docker-build-could-not-resolve-archive-ubuntu-com-apt-get-fails-to-install-anything-9ea4dfdcdcf2)



# Clear unused images to reclaim disk space

## Short way

```bash
docker system prune -f
```

## Long way

First (optional but recommended) remove any containers which are not running:

```bash
docker rm $(docker ps --filter "status=exited" -q --no-trunc)
```

Now clear intermediate images from partial builds (caches):

```bash
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

But [this](https://docs.docker.com/engine/reference/commandline/builder_prune/) might be a better way to clean only intermediate images:
```bash
docker builder prune
```

# Remove ALL docker containers and images

WARNING: This will destroy everything apart from running containers and their images

```bash
docker system prune --all
```

WARNING: This will destroy absolutely everything, including running containers!

```bash
docker stop $(docker ps -q)
docker kill $(docker ps -q)
docker container rm $(docker ps -a -q)
docker image rm -f $(docker images -a -q)
```

# Start a named docker container

If you give your container a name when you start it, it will be easier to find it later.

```bash
docker run --detach --name <container_name> <image_name>
```

# Start a docker container in interactive mode

If you want to interact with the process that the image starts up with.

```bash
docker run -it <image_name>
```

# Enter a docker image to debug

```bash
docker run --rm -it <image_id> /bin/bash
```

In this case we have used `--rm` (optional) to automatically remove the container when it stops.

Note that the above may not work if the Docker image has specified an entrypoint.  In such cases, we may need to override the entrypoint like so:

```
docker run --rm -it --entrypoint /bin/bash <image_id>
```

# Enter a docker container to debug

If your container has stopped, you must first restart it.

```bash
docker restart <container_name>
```

Now you can open a shell inside the container, to debug it:

```bash
docker exec -it <container_name> /bin/bash
```

Some images set a default user.  If you want to enter the container as the root user, add `-u root`

# Install some useful debugging tools

```bash
# For Alpine Linux
apk add bash procps findutils bind-tools nmap man vim curl

# For Debian
apt-get update && apt-get -y install procps findutils inetutils-ping dnsutils nmap man vim curl

alias l='ls -lartFh --color'
```

# Stop a docker container

```bash
docker stop <container_name>
```

# Copy files into or out of a docker container

```bash
docker cp <container_id>:/path /path
docker cp /path <container_id>:/path
```

This even works with containers which are not running!

We can also remove files:

```bash
docker rm -fv /unwanted/file
```

# Copy files out of a docker image

We can even copy from an image [without starting it](https://stackoverflow.com/a/51186557/99777).

```bash
docker create --name temp <image_name>

docker cp temp:/path /path
```

## Working around the symlinks bug when copying

Docker can have trouble copying symlinks:

> invalid symlink "/foo/bar" -> "../baz"

We can work around that by copying to stdout and then extracting:

```bash
docker cp <container_id>:/path - | tar x

# Or safer:
mkdir dest
docker cp <container_id>:/path - | tar -C dest -x
```

# Export and import

We can also export an entire container (running or stopped):

```bash
docker export <container_name> > container.tar
docker export <container_name> | gzip -c > container.tgz
```

and import it again later as a new image:

```bash
docker import container.tgz <image_repository_name>
```

but note that in this case the image is not layered, so it will take the full size.



# Other docker tools

- [nsenter](https://github.com/jpetazzo/nsenter) - Easy way to start a shell inside a container (although `docker exec` has now taken its place).  Includes `docker-enter`.

- [baseimage](http://phusion.github.io/baseimage-docker/) - A Docker image designed to run a full Linux system, rather than just one process.  (syslog, cron, ssh, logrotate, ...)



# See also

- Recommendations for creating images: https://developers.redhat.com/blog/2016/02/24/10-things-to-avoid-in-docker-containers/
