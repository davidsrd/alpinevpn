FROM alpine 

RUN apk update && \
	apk add openvpn iptables socat curl openssl

ADD ./bin /sbin
RUN chmod a+x /sbin/*

VOLUME /etc/openvpn

EXPOSE 1194/udp 8080/tcp

CMD run --cap-add=NET_ADMIN

