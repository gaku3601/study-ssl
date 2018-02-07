if [ -e /etc/letsencrypt/live ]; then
    echo "SSL Certificate Folder is Fonund"
else
    echo "SSL Certificate Folder is Not Fonund"
    certbot certonly --test-cert --webroot --webroot-path /usr/share/nginx/html/ssl -d takuto.gakusmemo.com -m pro.gaku@gmail.com --agree-tos -n
    mv /etc/nginx/conf.d/default.ssl.conf~ /etc/nginx/conf.d/default.ssl.conf
    supervisorctl restart nginx
fi

echo "process end"
exit 0
