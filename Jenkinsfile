#!groovy
pipeline {

    agent any
    stages {
        stage('Cloning our Git') {
            steps {
                git branch: 'master',
                    credentialsId: 'Git_credentials',
                    url: 'https://github.com/Anuradhabalaji/flask-rest.git'
            }
        }
       stage('Building our image') {
            steps {
               sh  "docker build -t flask-rest ."
               sh "docker run -p 8000:8000 flask-rest"
               sh "docker login --username dockeruseranu123 --password Raghav!23"
                sh "docker push dockeruseranu123/imgflaskrest:v1.0.0 ."

                }
            }
        }


 }