FROM ubuntu
MAINTAINER  Brendan Murphy
 
RUN apt-get update -qq && apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD app /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app

ENV NGINX_RUN_USER www-data
ENV NGINX_RUN_GROUP www-data
ENV NGINX_LOG_DIR /var/log/nginx
ENV NGINX_BACKEND_IP 172.17.42.1
ENV NGINX_BACKEND_PORT 80
ENV NGINX_SERVER_NAME localhost

EXPOSE 80

CMD ["nginx"]
