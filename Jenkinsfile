pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "my-demo-app"  // Name of your docker image
        DOCKER_REGISTRY = "docker.io" // Docker registry (e.g., docker.io, amazon ECR, etc.)
        DOCKER_TAG = "latest"         // Tag for the image
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from your SCM (e.g., GitHub)
                git url: 'https://github.com/surajnikam0/devopsdemo3.git', branch: 'master'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in your repo
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
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
