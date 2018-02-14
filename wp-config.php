<?php
# Ovaj file sluzi u svrhu konfigurisanja Wordpressa da se konektuje na MySQL container
# Ovdje definisemo na koju bazu ce se Wordpress konektovati, na kojem hostu, sa kojim userom i passwordom

define('DB_NAME', 'Klika');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'WordKlikaPass');
define('DB_HOST', '192.168.5.2:3306');
?>