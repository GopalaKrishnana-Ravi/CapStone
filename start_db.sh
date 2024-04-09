#!/bin/bash

Username=$1
Password=$2

#docker tag gopalakrishnanravi/capstone:dev gopalakrishnanravi/capstone:old 2> /dev/null

docker rmi -f gopalakrishnanravi/capstone:dev 2> /dev/null

docker build . -t gopalakrishnanravi/capstone:dev

docker images

docker login -u $Username -p $Password

docker push gopalakrishnanravi/capstone:dev

docker logout
