FROM rhscl/s2i-core-rhel7

ENV HTTPD_LISTEN_PORT 8080

RUN yum install -y httpd24 \
 && yum clean all \
 && install -d -m 775 /var/lib/webdav

ADD webdav.conf /opt/rh/httpd24/root/etc/httpd/conf/
USER 1000
CMD ["scl", "enable", "httpd24", "httpd -D FOREGROUND -f /opt/rh/httpd24/root/etc/httpd/conf/webdav.conf"]
