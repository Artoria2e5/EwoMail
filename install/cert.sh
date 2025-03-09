#!/usr/bin/env bash -e

DOMAIN=$1

if [[ ! $DOMAIN ]]; then
    echo "No domain provided">&2
    exit
fi

yum install -y certbot
systemctl enable certbot-renew.timer
systemctl stop nginx
certbot standalone -d "$DOMAIN" -d "imap.$DOMAIN" -d "smtp.$DOMAIN" -d "www.$DOMAIN"
rm /etc/ssl/certs/{dovecot,postfix}.pem || true
ln -s /etc/ssl/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/ssl/certs/dovecot.pem
ln -s /etc/ssl/letsencrypt/live/"$DOMAIN"/fullchain.pem /etc/ssl/certs/postfix.pem
cat << EOF > /etc/letsencrypt/renewal-hooks/pre/00nginx
sudo systemctl stop nginx
EOF
cat << EOF > /etc/letsencrypt/renewal-hooks/post/00nginx
chown -R www:root /etc/letsencrypt/
sudo systemctl start nginx
EOF
chmod +x /etc/letsencrypt/renewal-hooks/*/*
systemctl start nginx
