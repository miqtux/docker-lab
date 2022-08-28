pipeline {

    agent any

    stages {
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