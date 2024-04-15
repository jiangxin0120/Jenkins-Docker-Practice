pipeline {
    agent any
    stages {
        stage('Check out') {
            steps {
                // Checkout from a Git repository
                git url: 'https://github.com/jiangxin0120/lab2', credentialsId: 'Github-Token'
            }
        }
        stage('Build Maven project') {
            steps {
                script {
                    def mvnHome = tool 'Maven'
                    sh "${mvnHome}/bin/mvn clean package"
                }
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
                withCredentials([usernamePassword(credentialsId: 'Docker-Hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
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
