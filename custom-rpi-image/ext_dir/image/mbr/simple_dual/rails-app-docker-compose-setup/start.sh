#!/bin/sh

set -eu

sudo docker compose -f docker-compose.prod.yml --profile app up -d