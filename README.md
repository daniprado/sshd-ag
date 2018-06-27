# SSHd-ag
> Simple SSH server with a single user and key-only access.

This docker container starts an [OpenSSH server](https://www.openssh.com/) exposing it.\
It is meant to be an alternative to chroot-ssh-server while creating SSH-tunnels.\
You will only be able to connect to it using ssh-key.

## Usage
* Clone this repository.
* Build the image.
```
docker build -t sshd-ag .

or

docker-compose create
```
* Run the service for the first time.
```
docker run \
  --name=sshd \
  -p 22:22 \
  -v /docker/volumes/sshd:/ssh \
  -e USER='buraco' \
  -e MOTD='Welcome to argallar.net's ssh-tunnel' \
sshd-ag

or

docker-compose up sshd
```
> Note you need to create `/docker/volumes` path in advance. Otherwise change `docker-compose.yml` or `docker run` command accordingly.
* Once service is started you will need a ssh-key to access the server. Generate it...
```
ssh-keygen -t rsa -b 4096 -C "buraco's key"
```
* ...and put pubkey on `/docker/volumes/sshd/authorized_keys`.

## Contributing
1. Fork it.
2. Create your feature branch (`git checkout -b feature/fooBar`).
3. Commit your changes (`git commit -am 'Add some fooBar'`).
4. Push to the branch (`git push origin feature/fooBar`).
5. Create a new Pull Request.

## Release History
* 0.0.1
    * Work in progress

## Meta
Daniel Prado – dpradom@argallar.com

Distributed under the GPLv3 license. See ``LICENSE`` for more information.


