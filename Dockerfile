FROM alpine 

RUN apk update && \
	apk add openvpn iptables socat curl openssl

ADD ./bin /sbin
RUN chmod a+x /sbin/*

RUN adduser -D foo

RUN a_pass=$(echo fubar | mkpasswd) && \
    echo "root:${a_pass}" | chpasswd

USER foo

VOLUME /etc/openvpn

EXPOSE 1194/udp 8080/tcp

CMD run 

