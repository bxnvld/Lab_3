pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git '<https://github.com/bxnvld/CheckWebServer.git>'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t image_name .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push image_name'
            }
        }
    }
}