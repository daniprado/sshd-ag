#!/bin/sh

if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
	ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
    echo ${MOTD} > /etc/motd
	echo -e "PasswordAuthentication no\nPermitTunnel yes" >> /etc/ssh/sshd_config
    sed -i -e "s/.ssh\/authorized_keys/\/ssh\/authorized_keys/g" /etc/ssh/sshd_config
fi

HOME=/home/${USER}
if [ ! -d "${HOME}" ]; then
    PASS=iwillneveruseit
    adduser -D ${USER}
    echo -e "${PASS}\n${PASS}\n" | passwd ${USER}
    chown -R ${USER}: ${HOME}

    chmod 700 /ssh
    touch /ssh/authorized_keys
    chmod 600 /ssh/authorized_keys
    chown -R ${USER}: /ssh
fi

if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
fi

exec "$@"

