#!/bin/bash

# Install WordPress
wp core install \
  --url="http://localhost:6789" \
  --title="WordPress" \
  --admin_user="root" \
  --admin_password="password" \
  --admin_email="admin@example.com" \
  --skip-email

# Update permalink structure
wp option update \
  permalink_structure "/%year%/%monthnum%/%day%/%postname%/" \
  --skip-themes \
  --skip-plugins \
  --skip-packages

# Activate my theme
wp theme activate my-theme

# Activate my plugin
wp plugin activate my-plugin
