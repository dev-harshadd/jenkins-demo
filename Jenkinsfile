pipeline {
  agent any

  stages {
    stage('Pull Code Harshad') {
      steps{
        git branch: 'main', url: 'https://github.com/dev-harshadd/jenkins-demo'
      }
    }

    stage('BUild Docker Image'){
      steps{
        script{
          docker.build('harshad-python-app')
        }
      }
    }

    stage('Run Container'){
      steps{
        script{
          docker.image('harshad-python-app').run();
        }
      }
    }
  }
}

  
