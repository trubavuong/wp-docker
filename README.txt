1. Setup WordPress via Docker
   $ cd docker/{wordpress-variant}
   $ sudo docker-compose -f ../docker-compose.yml -p {project-name} up --build

2. Custom WP-CLI scripts
   $ cd docker/{wordpress-variant}

   # Run WordPress installation process
   $ sudo docker-compose -f ../docker-compose.yml -p {project-name} run --rm wp /usr/local/bin/wp-cli-custom/install-wp.sh
