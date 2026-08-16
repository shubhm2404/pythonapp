pipeline{

	agent any

	stages{
	
	  stage('Checkout') {
			steps {
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
                                sh 'sudo docker build -t shubhamdige24/python-devops-app:latest .'
                        }
                }

                stage('Docker push'){
                        steps{
                                sh 'sudo docker push shubhamdige24/python-devops-app:latest'
                        }

                }

	

	}






}
