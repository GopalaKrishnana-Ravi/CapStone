def GIT_URL = "https://github.com/GopalaKrishnana-Ravi/CapStone.git"
//def BRANCH_NAME = "dev"
pipeline {
    agent {
        label 'QA'
    }
    parameters {
        string(name='BRANCH_NAME')
    }

    stages{
//checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/GopalaKrishnana-Ravi/CapStone.git']])
        stage ('Git SCM') {
            steps {
                checkout (
                    $class: 'GitSCM',
                    branches: [[name: "${params.BRANCH_NAME}"]],
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
                    sh """
                    echo "Branch name:- ${params.BRANCH_NAME}"
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