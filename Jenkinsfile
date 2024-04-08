def GIT_URL = "https://github.com/GopalaKrishnana-Ravi/CapStone.git"
pipeline {
    agent {
        label 'QA'
    }
    // parameters {
    //     string(name='BRANCH_NAME')
    // }

    stages{
        stage ('Git SCM') {
            steps {
                checkout (
                    $class: 'GitSCM',
                    branches: [[name: "${env.BRANCH_NAME}"]],
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
                    switch (env.BRANCH_NAME){
                        case 'main':
                            sh """
                            echo "Branch name is :- ${env.BRANCH_NAME}"
                            echo "you are in main branch"
                            """
                            break
                        case 'dev':
                            sh """
                            echo "Branch name is:- ${env.BRANCH_NAME}"
                            echo "you are in dev branch lets' rock"
                            """
                            break
                        }
                }
            }
        }
    }
}