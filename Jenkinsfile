pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/<your-username>/<your-repo>.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flaskapp .'
            }
        }

        stage('Deploy to EC2 App Server') {
            steps {
                sshagent(['app-server-key']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no ec2-user@<APP_EC2_PUBLIC_IP> '
                        docker rm -f flaskapp || true &&
                        docker rmi flaskapp || true &&
                        docker pull flaskapp &&
                        docker run -d -p 80:80 --name flaskapp flaskapp
                    '
                    '''
                }
            }
        }
    }
}
