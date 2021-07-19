#!groovy
pipeline{
    agent any

    environment{
        dockerImage = ''
        registry = 'dockeruseranu123/pythonapp'
    }
    stages{
        stage('GIT Clone'){
            steps{
                git credentialsId: 'Git_credentials', url: 'https://github.com/Anuradhabalaji/flask-rest.git'
            }
		}
        stage('Build Docker image'){
            steps{
                script{
                    dockerImage = docker.build registry
                }
            }
        }

    }
}