#!/usr/bin/env bash
#docker build --rm=true -t ivonet/firefox .
docker build -t ivonet/chromium-browser .
docker rmi $(docker images -q -f dangling=true)
