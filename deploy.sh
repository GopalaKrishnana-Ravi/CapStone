#!/bin/bash

Username=$1
Password=$2

docker stop capstone-react-app 2> /dev/null

docker rm capstone-react-app 2> /dev/null

docker rmi -f gopalakrishnanravi/privatecapstone:prod 2> /dev/null

docker build . -t gopalakrishnanravi/privatecapstone:prod

#docker tag gopalakrishnanravi/capstone:prod gopalakrishnanravi/privatecapstone:prod

docker login -u $Username -p $Password

docker push gopalakrishnanravi/privatecapstone:prod

docker pull gopalakrishnanravi/privatecapstone:prod

docker logout 

docker images

docker-compose up -d