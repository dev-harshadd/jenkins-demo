pipeline {
	agent any
	
	
	tools{
		maven 'Maven_3.9.9'
		jdk 'JDK 17'
	}
	
	
	stages {
		stage('Checkout'){
			steps{
				checkout scm
			}
			
		}
		
		
		stage('Build'){
			steps{
			
			  sh 'mvn clean install'
			  
			}
		}
		
		
		stage('Run & Verify'){
			steps {
			
				sh 'java -jar target/*.jar & sleep 6 && curl --fail http://localhost:8080/'
				
			}
			post {
			
				always {
				
					sh 'pkill -f "java -jar" || true'
					
				}
				
			}
		}
		
		stage('Archive') {
            steps {
                // Save the built JAR as a downloadable artifact in Jenkins
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
        
       }
		
		post {
			success { echo 'pipeline completed successfully' }
			failure { echo 'pipeline failed-check the logs' }
			
		}
	}
			
		
		
	
		