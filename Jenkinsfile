
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
                        sh chmod +x deploy.sh
                        sh chmod +x pull_deploy.sh
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
                        sh chmod +x start_db.sh
                        sh start_db.sh $DOCKER_HUB_USER $PASSWORD
                                              
                        """
                    }   
                }
            }
        }
    }
}
