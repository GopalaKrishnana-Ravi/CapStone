#!/bin/bash

Username=$1
Password=$2

docker rmi -f gopalakrishnanravi/privatecapstone:prod 2> /dev/null

docker login -u $Username -p $Password

docker pull gopalakrishnanravi/privatecapstone:prod

docker logout 

docker images

docker-compose up -d