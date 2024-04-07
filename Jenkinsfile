def GIT_URL = "https://github.com/GopalaKrishnana-Ravi/CapStone.git"
def BRANCH_NAME = "dev"
pipeline {
    agent {
        label 'QA'
    }

    stages{
//checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/GopalaKrishnana-Ravi/CapStone.git']])
        stage ('Git SCM') {
            steps {
                echo "Checking out from Git repository: ${GIT_URL}"
                echo "Branch: ${BRANCH_NAME}"

                checkout (
                    $class: 'GitSCM',
                    branches: [[name: "${BRANCH_NAME}"]],
                    extensions: [],
                    userRemoteConfigs: [
                        [
                            url: "${GIT_URL}"
                        ]
                    ]
                )
            }
        }
        stage ('List workbook file'){
            steps {
                script {
                    echo "Branch :- ${env.BRANCH_NAME}"
                    sh """
                    pwd
                    ls -ltr
                    hostname
                    whoami
                    """
                }
            }
        }
    }
}