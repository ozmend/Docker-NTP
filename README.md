# Docker-NTP

CentOS/systemd NTP Docker CentOS 7 Systemd based NTP server.
Create ntp folder. Exp: "/opt/ntp/" , edit "ntp.conf" file according to your needs and run it.

RUN docker run -d --cap-add SYS_TIME --restart unless-stopped --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /opt/ntp/ntp.conf:/etc/ntp.conf:ro -p 123:123/udp --name ntp ntp
