FROM ubuntu:latest

COPY . .

RUN  DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    php libapache2-mod-php

RUN DEBIAN_FRONTEND=noninteractive apt install systemctl -y

RUN DEBIAN_FRONTEND=noninteractive apt install -y openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip

RUN systemctl restart apache2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


CMD [ "bash" ]