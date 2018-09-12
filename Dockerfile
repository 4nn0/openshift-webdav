FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

ENV HTTPD_LISTEN_PORT 8080

RUN install -d -m 775 /var/www/webdav && install -d -m 775 /var/www/data

ADD webdav.conf /opt/rh/httpd24/root/etc/httpd/conf/
USER 1001
CMD ["scl", "enable", "httpd24", "httpd -D FOREGROUND -f /opt/rh/httpd24/root/etc/httpd/conf/webdav.conf"]
