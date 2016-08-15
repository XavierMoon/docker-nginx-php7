#!/bin/sh
Nginx_Install_Dir=/usr/local/nginx

set -e


sed -i "s#API_URL#${API_URL}#g" /usr/local/nginx/conf/nginx.conf
sed -i "s#WEB_URL#${WEB_URL}#g" /usr/local/nginx/conf/nginx.conf
sed -i "s#BASE_DIR#${BASE_DIR}#g" /usr/local/nginx/conf/nginx.conf
#chmod -R 777 $BASE_DIR
echo "127.0.0.1 $API_URL\n 192.168.1.10 api.test.yundoukuaiji.com" > /etc/hosts






/usr/bin/supervisord -n -c /etc/supervisord.conf
