
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
                script {
                    sh """
                    echo "You are in dev branch we are good to build"
//                    docker build . -t gopalakrishnanravi/capstone
                    docker images
                    """
                }
            }
        }
    }
}
