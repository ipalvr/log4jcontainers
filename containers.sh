#!/bin/bash
set -ex
# setup environments for Log4Shell demo
docker network create dirty-net
docker container run -itd --rm --name vul-app-1 --network dirty-net fefefe8888/l4s-demo-app:1.0
docker container run -itd --rm --name vul-app-2 --network dirty-net fefefe8888/l4s-demo-app:1.0
docker container run -itd --rm --name att-svr --network dirty-net fefefe8888/l4s-demo-svr:1.0
docker container run -itd --rm --network dirty-net --name attacker-machine fefefe8888/my-ubuntu:18.04
# stop learning for vulnerable app container
#PROFILE_ID=$(curl -k -X GET -H "authorization: Bearer $TOKEN" -H 'Content-Type: application/json' "https://205.178.103.73:8083/api/v21.08/profiles/container" | jq -r ' .[] | select(.image == "${var.vul_app_image}") | ._id ')
#curl -k -X POST -H "authorization: Bearer $TOKEN" -H 'Content-Type: application/json' -d '{"state": "manualActive"}' "https://205.178.103.73:8083/api/v1/profiles/container/$PROFILE_ID/learn"
