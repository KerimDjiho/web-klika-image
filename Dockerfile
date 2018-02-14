# Povlaci Ubunut 16.04 sa Docker Hub kao base image
FROM ubuntu:16.04

# Run komanda da updatuje sistem, i instalira potrebne pakete.
# Ulazi u /var/www/html direktorij i tu skida Wordpress sa wordpress.org u tar formatu
# Dekompresuje u direktorij pod nazivom wordpress.
RUN apt-get update && \
	apt-get install mariadb-client curl apache2 apache2-utils php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd -y && \
	cd /var/www/html && curl -O https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz wordpress
	
# Dodaje glavni wordpress konfiguracijski file u wordpress direktorij kreiran u prethodnom koraku.
# U fileu se nalazi inicijalizacija veze sa bazom podataka koja se nalazi u MySQL containeru	
ADD ./wp-config.php /var/www/html/wordpress

# Skripta za testiranje veze.
ADD ./db-test.php /var/www/html/wordpress

# Kreira usera wordpress i dodaje ga u grupu www-data. Poslije toga tom useru daje vlasnistvo nad
# citavim wordpress direktorijem
CMD useradd -r wordpress:www-data && chown -R wordpress:www-data /var/www/html/wordpress	

# Pokrece Apache i otvara bash sesiju
CMD service apache2 start && /bin/bash

# Otkriva port
EXPOSE 80