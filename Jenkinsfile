pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flask-app'
        CONTAINER_NAME = 'flask-app-test'
        PORT = 5000
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the repository
                git 'https://github.com/surajnikam0/devopsdemo3.git'  // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container in detached mode (-d)
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:${PORT} ${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    // Wait for a few seconds to give the app time to start
                    sh 'sleep 10'

                    // Test if the Flask application is running using curl
                    def response = sh(script: "curl --write-out '%{http_code}' --silent --output /dev/null http://localhost:${PORT}", returnStdout: true).trim()

                    // Check the response code, expect 200 for a healthy app
                    if (response == '200') {
                        echo "Application is running successfully!"
                    } else {
                        error "Application is not running correctly. HTTP response code: ${response}"
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Stop and remove the container
                    sh "docker stop ${CONTAINER_NAME}"
                    sh "docker rm ${CONTAINER_NAME}"
                }
            }
        }
    }

    post {
        always {
            // Clean up images after the pipeline finishes to save disk space
            sh "docker rmi ${IMAGE_NAME}:${BUILD_NUMBER}"
        }
    }
}
