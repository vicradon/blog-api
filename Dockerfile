FROM ubuntu:latest

COPY . .

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN  apt-get update && apt-get install php libapache2-mod-php systemctl curl -y

RUN apt install -y openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip curl

RUN systemctl restart apache2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install

RUN cp .env.example .env

RUN php artisan key:generate

EXPOSE 8000

CMD [ "bash", "php artisan serve" ]