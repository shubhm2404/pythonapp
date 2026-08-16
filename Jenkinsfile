pipeline {
        agent any
                stages {
                        stage('CHECK') {
                                steps {
                                        sh 'mkdir -p devops'
                                }
                        }

			stage('Checkout') {
                               steps {
                                        checkout scm
                                }
                        }
                    
			stage('Install Dependencies') {
			       steps {
				        sh '''
						rm -rf venv
						python3 -m venv venv
						./venv/bin/pip install --upgrade pip
						./venv/bin/pip install -r requirements.txt
					 '''
				    }
			}



		       stage('Run Tests') {
				steps {
					sh './venv/bin/python -m pytest'
				}
			}

                        stage('Docker Build') {
                                steps {
                                       sh 'docker build -t shubhamdige24/python-devops-app:latest .'
                                        }
			}

			stage('Docker Login') {
			        steps {
				       withCredentials([
				       usernamePassword(
				       credentialsId: 'Docker login',
				       usernameVariable: 'DOCKER_USERNAME',
				       passwordVariable: 'DOCKER_PASSWORD'
				)
				])
				
				{
                                        sh '''
                                        echo "$DOCKER_PASSWORD" | docker login
                                        --username "$DOCKER_USERNAME" \
                                        --password-stdin
                                        '''
                                        }
                                }

				 
				}
			}

			stage('Docker Push') {
                                steps {
                                        sh 'docker push shubhamdige24/python-devops-app:latest'
                                }
			}

		
           }

}
