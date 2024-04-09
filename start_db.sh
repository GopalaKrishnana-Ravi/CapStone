#!/bin/bash

Username=$1
Password=$2

docker tag gopalakrishnanravi/capstone gopalakrishnanravi/capstone:old

docker build . -t gopalakrishnanravi/capstone

docker rmi -f gopalakrishnanravi/capstone:old

docker images

docker login -u $Username -p $Password

docker push gopalakrishnanravi/capstone

docker logout
