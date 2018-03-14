FROM alpine 

RUN apk update && \
	apk add openvpn iptables socat curl openssl

ADD ./bin /sbin
RUN chmod a+x /sbin/*

ONBUILD RUN --privileged

VOLUME /etc/openvpn

EXPOSE 1194/udp 8080/tcp

CMD run 

