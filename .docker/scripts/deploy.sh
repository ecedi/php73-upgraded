#!/usr/bin/env bash

. .env
exec echo ${PERSONAL_ACCOUNT_PASSWORD} | sudo -S setfacl -R -m u:"www-data":rwX -m u:`whoami`:rwX var/cache var/logs web/media
exec echo ${PERSONAL_ACCOUNT_PASSWORD} | sudo -S setfacl -dR -m u:"www-data":rwX -m u:`whoami`:rwX var/cache var/logs web/media
exec echo ${PERSONAL_ACCOUNT_PASSWORD} | sudo -S rm -fr ./etc/build/*
exec echo ${PERSONAL_ACCOUNT_PASSWORD} | sudo -S rm -fr ./var/cache/*

composer install
yarn install
yarn run gulp

exec echo ${PERSONAL_ACCOUNT_PASSWORD} | sudo -S apache2-foreground
