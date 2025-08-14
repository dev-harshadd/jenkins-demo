pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                git branch: 'main', url: 'https://github.com/dev-harshadd/jenkins-demo'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t harshad-python-app .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run --rm harshad-python-app'
            }
        }
    }
}
