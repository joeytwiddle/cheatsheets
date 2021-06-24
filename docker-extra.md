I do prefer Debian images because they use a CDN for the apt repository out of the box, for Ubuntu seems like archive.ubuntu.org is quite slow from SG, so always have to write sed -i 's/archive.ubuntu.com/sgp1.mirrors.digitalocean.com/g' /etc/apt/sources.list

-- Yong Jie Wong

## Security

Docker is designed to support trusted users running trusted containers.  Singularity supports the opposite model of untrusted users running untrusted containers.

https://sylabs.io/guides/2.6/user-guide/faq.html

https://www.reddit.com/r/docker/comments/7y2yp2/why_is_singularity_used_as_opposed_to_docker_in/


