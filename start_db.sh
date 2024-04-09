#!/bin/bash

Username=$1
Password=$2

docker tag gopalakrishnanravi/capstone gopalakrishnanravi/capstone:old 2> /dev/null

docker build . -t gopalakrishnanravi/capstone

docker rmi -f gopalakrishnanravi/capstone:old

docker images

echo "$Password" | docker login -u "$Username" --password-stdin

docker push gopalakrishnanravi/capstone

docker logout
