pipeline {
    agent any

    tools {
        maven 'Maven_3.9.9'
        jdk 'JDK 17'
    }

    environment {
        DOCKER_IMAGE = 'harshadbhandare/springboot-tomcat-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Clean Previous Containers') {
            steps {
                script {
                    sh "docker rm -f spring-app || true"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Docker Run') {
                steps {
                    script {
                    // Stop and remove previous if it exists
                    sh '''
                    docker stop spring-app || true
                    docker rm spring-app || true
                    '''

                    // Run on different host port if needed
                    sh 'docker run -d -p 9090:8080 --name spring-app harshadbhandare/springboot-tomcat-app'
                    }
                }
            }


        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully with Docker and Tomcat'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
}
