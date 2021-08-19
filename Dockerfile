FROM ubuntu:latest

COPY . .

RUN  DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -qy php 
    
# libapache2-mod-php

RUN DEBIAN_FRONTEND=noninteractive apt install systemctl -yq

# RUN DEBIAN_FRONTEND=noninteractive apt install -yq openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip

RUN systemctl restart apache2

RUN DEBIAN_FRONTEND=noninteractive -yq curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


CMD [ "bash" ]