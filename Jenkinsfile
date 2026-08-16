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
                                        sh 'exit'
					sh 'sudo su root'
					sh 'sudo apt update'
                                        sh 'sudo apt install python3 python3-pip python3-venv python3-dev build-essential -y'
                                        sh 'sudo apt install python3 -y'
                                        sh 'pip install -r requirements.txt'
                                        sh 'python3 -m pytest'
                                        sh 'python3 -m Flask'
					sh 'sudo su jenkins'
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

