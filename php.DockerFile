FROM debian:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 wget
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN apt update
RUN apt install -y php8.0
RUN apt install -y composer
#COPY ./php.ini /etc/php/8.0/apache2/php.ini
#COPY ./slc.conf /etc/apache2/sites-available/slc.conf
#COPY ./apache2.conf /etc/apache2/apache2.conf
RUN rm -rfv /etc/apache2/sites-enabled/*.conf
RUN ln -s /etc/apache2/sites-available/slc.conf /etc/apache2/sites-enabled/slc.conf
CMD ["apachectl","-D","FOREGROUND"]
RUN a2enmod rewrite
EXPOSE 80
EXPOSE 443