
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
                script {
                    sh """
                    echo "you are in main branch we are good to deploy"
                    """
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
                        sh start_db.sh
                        docker login -u "$DOCKER_HUB_USER" -p "$PASSWORD"
                        """

                    }   
                }
            }
        }
    }
}
