FROM ubuntu
MAINTAINER  Brendan Murphy

# ruby dependencies
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev openssl curl nginx
RUN \curl -L https://github.com/sstephenson/ruby-build/archive/v20140524.tar.gz | tar -zxvf - -C /tmp/

# Install ruby-build
RUN cd /tmp/ruby-build-* && ./install.sh && cd / && rm -rfv /tmp/ruby-build-master

# Install ruby
RUN ruby-build -v 2.1.5  /usr/local

# Install gems
RUN gem install bundler rubygems-bundler --no-rdoc --no-ri

# Regenerate binstubs
RUN gem regenerate_binstubs

RUN echo "daemon off;" >> /etc/nginx/nginx.conf



EXPOSE 80

CMD ["nginx"]
