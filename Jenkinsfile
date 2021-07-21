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

        stage('k8s Deploy'){
            steps{
            script{
                kubectl apply -f 'Deployment.yaml'
            }
/*
                configs: '', kubeConfig: [path: ''], kubeconfigId: 'k8s', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
 */

                 }
        }

   }
}