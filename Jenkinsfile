def GIT_URL = "https://github.com/GopalaKrishnana-Ravi/CapStone.git"
// def BRANCH_NAME = "dev"
pipeline {
    agent {
        label 'QA'
    }
    parameters {
        string(name='BRANCH_NAME')
    }

    stages{
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
        stage ('Using Switch condition'){
            steps {
                script {
                    switch (params.BRANCH_NAME){
                        case 'main':
                            sh """
                            echo "Branch name is :- ${params.BRANCH_NAME}"
                            echo "you are in main branch"
                            """
                            break
                        case 'dev':
                            sh """
                            echo "Branch name is:- ${params.BRANCH_NAME}"
                            echo "you are in dev branch lets' rock"
                            """
                        }
                }
            }
        }
    }
}