#!/bin/bash

apt update -y
apt install github docker.io -y
sysmtectl enable --now docker

cd /opt

git clone https://github.com/Nabixka/lks-tier-maker.git

cd lks-tier-maker/services/users

npm install


cat << 'EOF' > .env
PORT     = 5000
NODE_ENV = production
DB_HOST  = host
DB_NAME  = name
DB_USER  = user
DB_PASS  = pass
EOF

docker build -t user-app .
docker run -d \
    --name user-app \
    --restart always \
    --env-file .env \
    -p 5000:5000 \
    user-app