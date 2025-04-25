#!/bin/sh

set -eu

# Check certbot status file and logs
if sudo [ -f ~/nginx-ssl/certbot/conf/live/<DOMAIN>/cert.pem ]; then
  sudo docker compose -f docker-compose.prod.yml up -d certbot
  sudo docker exec nginx nginx -s reload
else
  # start the init profile to obtain a cert
  sudo docker compose -f docker-compose.prod.yml --profile init up -d

  echo "Waiting for certbot to complete..."
  while sudo docker ps -q -f name=certbot-init | grep -q .; do
      sleep 2
  done

  # Stop and remove nginx-init
  sudo docker compose -f docker-compose.prod.yml --profile init down
fi
