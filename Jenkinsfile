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
                        stage('Test') {
                                steps {
					sh 'apt install python3 python3-pip python3-venv python3-dev build-essential -y'
                                        sh 'apt install python3 -y'
                                        sh 'pip install -r requirements.txt'
                                }
                        }
                        stage('Docker Build') {
                                steps {
                                       sh 'docker build -t shubhamdige24/python-devops-app:latest .'
                                        }
			}
			stage('Docker Push') {
                                steps {
                                        sh 'docker push shubhamdige24/python-devops-app:latest'
                                }
			}

		}
           }

