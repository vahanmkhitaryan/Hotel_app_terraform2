FROM ubuntu:22.04

WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y apache2 php libapache2-mod-php php-mysql mysql-client

COPY . .

EXPOSE 80

CMD ["bash", "-c", "./setup.sh && apachectl -D FOREGROUND"]

