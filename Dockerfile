FROM centos:7

RUN yum install wget -y \
    && yum clean all && rm -rf /var/cache/yum \
    && wget https://github.com/fatedier/frp/releases/download/v0.27.0/frp_0.27.0_linux_amd64.tar.gz \
    && tar xvf frp_0.27.0_linux_amd64.tar.gz \
    && mv frp_0.27.0_linux_amd64/frps /usr/local/bin/ \
    && rm -rf frp_0.27.0_linux_amd64*

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/local/bin/frps","-c","/etc/frps.ini"]
