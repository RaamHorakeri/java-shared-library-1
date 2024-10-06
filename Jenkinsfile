@Library('jenkins-shared-library') _

pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/RaamHorakeri/java-shared-library-1.git'
        IMAGE_NAME = 'raam2023/java-web-app'
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials-id'
        PORT_MAPPING = '8081:8081'
        TAG = "${env.BUILD_ID}"
    }

    stages {
        stage('Checkout from Git') {
            steps {
                script {
                    dockerPipeline.checkoutFromGit(REPO_URL)
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def app = dockerPipeline.buildDockerImage(IMAGE_NAME, TAG)
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    dockerPipeline.pushDockerImage(IMAGE_NAME, TAG, DOCKER_CREDENTIALS_ID)
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    dockerPipeline.runDockerContainer(IMAGE_NAME, TAG, PORT_MAPPING)
                }
            }
        }
    }
}
