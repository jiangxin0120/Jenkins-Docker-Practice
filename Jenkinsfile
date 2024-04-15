pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-Hub')
    }
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
                withCredentials([usernamePassword(credentialsId: 'Docker-Hub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    // Use the credentials to login to Docker Hub
                    sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                }
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
