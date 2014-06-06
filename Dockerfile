FROM ubuntu
MAINTAINER  Brendan Murphy
 
RUN apt-get update -qq && apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl
ADD default /etc/nginx/sites-available/default
ADD default-ssl /etc/nginx/sites-available/default-ssl


ADD default /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ENV NGINX_RUN_USER www-data
ENV NGINX_RUN_GROUP www-data
ENV NGINX_LOG_DIR /var/log/nginx
ENV NGINX_BACKEND_IP 172.17.42.1
ENV NGINX_BACKEND_PORT 80
ENV NGINX_SERVER_NAME localhost

EXPOSE 80

CMD ["nginx"]