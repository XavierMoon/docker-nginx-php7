#!/bin/sh
Nginx_Install_Dir=/usr/local/nginx

set -e


sed -i "s#API_URL#${API_URL}#g" /usr/local/nginx/conf/nginx.conf
sed -i "s#WEB_URL#${WEB_URL}#g" /usr/local/nginx/conf/nginx.conf
sed -i "s#BASE_DIR#${BASE_DIR}#g" /usr/local/nginx/conf/nginx.conf
#chmod -R 777 $BASE_DIR
echo -e  "127.0.0.1 $API_URL \n 117.114.196.166 api.test.yundoukuaiji.com" > /etc/hosts




__create_user() {
# Create a user to SSH into as.

SSH_USERPASS=root
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin root)
echo ssh root password: $SSH_USERPASS
}

# Call all functions
__create_user

/usr/bin/supervisord -n -c /etc/supervisord.conf
