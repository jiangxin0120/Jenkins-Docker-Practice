pipeline {
    environment {
        // Reference the stored credentials by ID
        DOCKER_CREDENTIALS = credentials('Docker-Hub')
    }
    agent any
    stages {
        stage('Check out') {
            steps {
                // Checkout from a Git repository
                git 'https://github.com/jiangxin0120/lab2'
            }
        }
        stage('Build Maven project') {
            steps {
                // Build the Maven project
                sh 'mvn clean package'
            }
        }
        stage('Docker build') {
            steps {
                // Build the Docker image
                sh 'docker build -t jiangxin0120/mavenwebapp:tag .'
            }
        }
        stage('Docker login') {
            steps {
                // Login to Docker Hub using the stored credentials
                sh 'echo $DOCKER_CREDENTIALS_USR:$DOCKER_CREDENTIALS_PSW | docker login --username $DOCKER_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Docker push') {
            steps {
                // Push the Docker image to Docker Hub
                sh 'docker push jiangxin0120/mavenwebapp:tag'
            }
        }
    }
}
