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
                // Login to Docker Hub using the stored credentials
                withCredentials([usernamePassword(credentialsId: 'Docker-Hub', usernameVariable: 'Username', passwordVariable: 'Password')]) {
                    sh 'echo $DOCKER_PASS | docker login --username $DOCKER_USER --password-stdin'
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
