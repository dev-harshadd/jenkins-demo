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
	        		// Start app in background
	       			 sh 'nohup java -jar target/*.jar > app.log 2>&1 & echo $! > app.pid'
	
			        // Wait for app to start (adjust sleep as needed)
			        sh 'sleep 10'
	     
	            }
	    post {
	        always {
	            // Kill the background process using PID
	            sh 'kill $(cat app.pid) || true'
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
			
		
		
	
		