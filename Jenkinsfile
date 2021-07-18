#!groovy
pipeline {
 environment {
        registry = "dockeruseranu123/flaskrestrepo"
        registryCredential = 'DockerRegistrycr'
    }

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
               sh  "docker build -t ec2-user/flask-rest ."
                  }
            }
       stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry(registry, registryCredential) {
                    sh "docker push dockeruseranu123/imgflaskrest:v1.0.0 ."
                    }
                }
            }
		}
}

        post {
        success {
            mail to: 'radh27@gmail.com',
            subject: "${BUILD_TAG} : ${currentBuild.currentResult}",
            body: "Success"
            cleanWs()
        }
        failure {
            mail to: 'radh27@gmail.com',
            subject: "${BUILD_TAG} : ${currentBuild.currentResult}",
            body: "Failure"
            cleanWs()
        }
    }


}