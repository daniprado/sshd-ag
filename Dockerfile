LABEL net.argallar.name="sshd-ag"
LABEL net.argallar.version="0.0.1"

FROM alpine:latest

RUN apk add --update openssh \
&& rm  -rf /tmp/* /var/cache/apk/*

COPY files/start.sh /usr/local/bin

RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key
RUN mkdir /ssh

EXPOSE 22 
VOLUME /ssh
ENTRYPOINT ["start.sh"]

CMD ["/usr/sbin/sshd","-D"]

