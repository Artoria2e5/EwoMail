#!/usr/bin/env bash -e

DOMAIN=$1

if [[ ! $DOMAIN ]]; then
    echo "No domain provided">&2
    exit
fi

yum install -y certbot
systemctl stop nginx
certbot standalone -d "$DOMAIN" -d "imap.$DOMAIN" -d "smtp.$DOMAIN"
rm /etc/ssl/certs/{dovecot,postfix}.pem || true
ln -s /etc/ssl/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/ssl/certs/dovecot.pem
ln -s /etc/ssl/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/ssl/certs/postfix.pem 
systemctl start nginx
