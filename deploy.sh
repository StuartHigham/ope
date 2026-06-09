#!/bin/bash
set -e

cd /var/www/ope

git pull origin $1

npm ci
npm run build

pm2 restart ope || pm2 start npm --name "ope" -- start

echo "Deploy complete"