FROM centos/systemd

LABEL maintainer="ozmend@gmail.com" \
	org.label-schema.schema-version="1.0" \
	org.label-schema.docker.cmd="docker run -d --cap-add SYS_TIME --restart unless-stopped --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /opt/ntp/ntp.conf:/etc/ntp.conf:ro -p 123:123/udp --name ntp ntp" \
	org.label-schema.description="CentOS7 based NTP service" \
	org.label-schema.vendor="Ozmen Emre DEMIRKOL"

RUN yum update -y; \
	yum install ntp -y; \
	yum clean all; \
	rm -rf /var/cache/yum; \
	systemctl enable ntpd; \
	mv /etc/ntp.conf /etc/ntp.conf-bak; \
	rm -rf /etc/localtime; \
    	ln -s /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

EXPOSE 123/udp

CMD ["/usr/sbin/init"]
