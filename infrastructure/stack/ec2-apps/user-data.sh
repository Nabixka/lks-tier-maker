#!/bin/bash

# Update depedencies
apt update -y
apt install git docker.io -y
systemctl enable --now docker

cd /opt
git clone https://github.com/Nabixka/lks-tier-maker.git
cd lks-tier-maker/app

# Update this ENV
cat << 'EOF' > .env
VITE_API_URL = alb.dakjdl.ad
EOF

docker build -t my-app .
docker run -d \
  --name my-app \
  --restart always \
  -p 80:3000 \
  my-app