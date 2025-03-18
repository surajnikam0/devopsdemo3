pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-demo-app"  // Name of your docker image
        DOCKER_TAG = "latest"         // Tag for the image
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from your SCM (e.g., GitHub)
                git url: 'https://github.com/surajnikam0/devopsdemo3.git', branch: 'master'
            }
        }

        stage('Test') {
            steps {
                script {
                    // Add testing commands here. Example:
                    echo "Running tests..."
                    // You can replace this with actual test commands, e.g., npm test, pytest, etc.
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Example of running the docker container, adjust to your deployment
                    sh "docker run -d -p 5000:5000 ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        always {
            // Clean up
            cleanWs()
        }
        success {
            echo "Pipeline finished successfully!"
        }
        failure {
            echo "Pipeline failed. Please check the logs."
        }
    }
}

