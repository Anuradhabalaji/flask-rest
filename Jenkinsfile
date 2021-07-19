pipeline{
    agent any

    environment{
        dockerImage = ''
        registry = 'dockeruseranu123/pythonapp'
        registryCredential = 'DockerRegistrycr'
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
         stage('uploading image'){
            steps{
                script{
                      docker.withRegistry( '', registryCredential ) {
                      dockerImage.push()
                      }
                }
            }

        }
		 // Stopping Docker containers for cleaner Docker run
     stage('docker stop container') {
         steps {
            sh 'docker ps -f name=mypythonappContainer -q | xargs --no-run-if-empty docker container stop'
            sh 'docker container ls -a -fname=mypythonappContainer -q | xargs -r docker container rm'
         }
       }

	       // Running Docker container, make sure port 8100 is opened in
    stage('Docker Run') {
		 steps{
			 script {
				dockerImage.run("-p 8100:8000 --rm --name mypythonappContainer")
			 }
		  }
	  }

    }
}