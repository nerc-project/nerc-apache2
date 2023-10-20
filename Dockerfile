FROM debian:12
RUN apt update
RUN apt install -y apache2
RUN apt install -y libapache2-mod-wsgi-py3
RUN apt install -y libapache2-mod-auth-openidc
RUN a2enmod wsgi
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod headers
RUN a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod auth_openidc
RUN a2ensite default-ssl
COPY files/apache2-foreground /usr/bin/apache2-foreground
RUN chmod 755 /usr/bin/apache2-foreground
CMD /usr/bin/apache2-foreground
