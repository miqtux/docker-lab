pipeline {

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        cleanWs{}
        git credentialsId:dockerhub, url:'https://github.com/miqtux/docker-lab.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                sh 'docker image build -f 841301/app-python:latest .' 
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
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