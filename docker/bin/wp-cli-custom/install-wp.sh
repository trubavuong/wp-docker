#!/bin/bash

# Install WordPress
wp \
	--allow-root \
	--path="/var/www/html/" \
	core install \
  --url="http://localhost:6789" \
  --title="My Project" \
  --admin_user="root" \
  --admin_password="password" \
  --admin_email="admin@example.com" \
  --skip-email

# Update permalink structure
wp \
	--allow-root \
	--path="/var/www/html/" \
	option update permalink_structure "/%year%/%monthnum%/%day%/%postname%/" \
  --skip-themes \
  --skip-plugins \
  --skip-packages

# Activate my theme
wp \
	--allow-root \
	--path="/var/www/html/" \
	theme activate my-theme

# Activate my plugin
wp \
	--allow-root \
	--path="/var/www/html/" \
	plugin activate my-plugin
