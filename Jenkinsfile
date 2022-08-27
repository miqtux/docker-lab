pipeline {

    agent any

    stages {

        stage('Checkout Source') {
            steps {
                cleanWs{}
                    git credentialsId:miqtux, url:'https://github.com/miqtux/docker-lab.git', branch:'master'
            }
        }
    
        stage("Build image") {
            steps {
                sh 'docker image build -f 841301/app-python:latest .' 
            }
        }

        stage('Deploy App') {
            steps {
                sh '''
                kubectl get nodes
                kubectl apply -f deployment.yaml -n app-python
                kubectl get pods -n app-python
                '''
            }
        }
  }  
}