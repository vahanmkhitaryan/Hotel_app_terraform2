#!/usr/bin/env bash
set -euo pipefail

# Start Apache
service apache2 start

# Load DB schema (using passed env vars)
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < ./bluebirdhotel.sql

# Deploy app to Apache root
rm -f /var/www/html/index.html
cp -r ./* /var/www/html/

# Restart Apache (in case config files changed)
service apache2 restart

echo "✅ App deployed! Access it via: http://localhost"
