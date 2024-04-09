
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
                        sh deploy.sh {$DOCKER_HUB_USER} {$PASSWORD}
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
                        docker login -u "$DOCKER_HUB_USER" -p "$PASSWORD"
                        sh start_db.sh
                        docker logout                        
                        """
                    }   
                }
            }
        }
    }
}
