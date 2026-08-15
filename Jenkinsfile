pipeline{
	
	agent any

	stages{
		stage('checkout'){
			steps{
				checkout scm
			}
		}

		stage('Test'){
			steps{
				sh 'pip install -r requirements.txt'
				sh 'pytest'
			}
		}
		
		stage('Docker Build'){
			steps{
				sh 'docker build -t shubhamdige24/python-devops-app:latest .'
			}
		}
		
		stage('Docker push'){
			steps{
				sh 'docker push shubhamdige24/python-devops-app:latest'
			}

		}


	}

}







}
