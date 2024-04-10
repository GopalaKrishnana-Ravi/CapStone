Github repo URL
     https://github.com/GopalaKrishnana-Ravi/CapStone.git

deployed site URL
     http://3.110.182.139/

docker images
     gopalakrishnanravi/privatecapstone:prod

Create a docker-compose file to use the above image
		version: '3.8'
		services:
			react-app:
				image: gopalakrishnanravi/privatecapstone:prod
				container_name: capstone-react-app
				ports:
				  - 80:80
				  
build.sh— for building docker images
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



deploy.sh — for deploying the image to server
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

		docker logout 
		
		----------------
		#!/bin/bash

		Username=$1
		Password=$2

		docker rmi -f gopalakrishnanravi/privatecapstone:prod 2> /dev/null

		docker login -u $Username -p $Password

		docker pull gopalakrishnanravi/privatecapstone:prod

		docker logout 

		docker images

		docker-compose up -d
			

Docker Hub Like
  Private: https://hub.docker.com/repository/docker/gopalakrishnanravi/privatecapstone
  Public: https://hub.docker.com/repository/docker/gopalakrishnanravi/capstone
   
Jenkins Script to deploy the application
		pipeline {
				agent {
				    label 'QA'
				}
				stages {        
				    stage('deploy stage') {
				        when {
				            branch 'main'
				        }
				        steps {
				            withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'PASSWORD', usernameVariable: 'DOCKER_HUB_USER')]) {
				                script {
				                    sh """
				                    echo "you are in main branch we are good to deploy"
				                    sh deploy.sh $DOCKER_HUB_USER $PASSWORD
				                    sh pull_deploy.sh $DOCKER_HUB_USER $PASSWORD
				                    """
				                }
				            }
				        }
				    }

				    stage('build stage') {
				        when {
				            branch 'dev'
				        }
				        steps {
				            withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'PASSWORD', usernameVariable: 'DOCKER_HUB_USER')]) {
				                script {
				                    sh """
				                    echo "You are in dev branch we are good to build"
				                    sh start_db.sh $DOCKER_HUB_USER $PASSWORD
				                                          
				                    """
				                }   
				            }
				        }
				    }
				}
		}

ALL screen schot of the project will be available un screan_shot folder
