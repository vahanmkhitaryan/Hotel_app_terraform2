#!/usr/bin/env bash
set -euo pipefail

# Load SQL into DB
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < ./bluebirdhotel.sql

# Copy app files to Apache root
rm -f /var/www/html/index.html
cp -r ./* /var/www/html/

echo "✅ App deployed! Access it via: http://localhost"

# ✅ Start Apache in the foreground so container stays alive
exec apachectl -D FOREGROUND
