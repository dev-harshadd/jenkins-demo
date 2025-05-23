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
			
				sh 'java -jar target/*.jar'
				
			}
			 post {
                always {
                    // Kill any java process to clean up
                    sh 'pkill -f "java -jar" || true'
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
			success { echo 'pipeline completed successfully' }
			failure { echo 'pipeline failed-check the logs' }
			
		}
	}
			
		
		
	
		