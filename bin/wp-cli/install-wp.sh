#!/bin/bash

wp core install \
  --url="http://localhost:6789" \
  --title="WordPress" \
  --admin_user="root" \
  --admin_password="password" \
  --admin_email="admin@example.com" \
  --skip-email

wp option update \
  permalink_structure "/%year%/%monthnum%/%day%/%postname%/" \
  --skip-themes \
  --skip-plugins
