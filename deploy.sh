#!/bin/bash

Username=$1
Password=$2

docker stop capstone-react-app 2> /dev/null

docker rm capstone-react-app 2> /dev/null

docker rmi -f gopalakrishnanravi/privatecapstone 2> /dev/null

docker build . -t gopalakrishnanravi/capstone

docker tag gopalakrishnanravi/capstone gopalakrishnanravi/privatecapstone

docker login -u $Username -p $Password

docker push gopalakrishnanravi/privatecapstone

docker pull gopalakrishnanravi/privatecapstone

docker logout 

docker images

#docker-compose up -d