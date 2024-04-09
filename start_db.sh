#!/bin/bash

docker tag gopalakrishnanravi/capstone gopalakrishnanravi/capstone:old

docker build . -t gopalakrishnanravi/capstone

docker rmi -f gopalakrishnanravi/capstone:old

docker images
