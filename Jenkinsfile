pipeline {
    agent any
    
   tools {
       maven 'maven-3.9.4' 
        }
	
    stages {
        stage('Checkout') {
            steps {
                // Check out your source code from your version control system (e.g., Git)
                checkout scm
            }
        }

        stage('Unit Test') {
            steps {
                // Run unit tests (e.g., using Maven or Gradle)
                sh 'mvn test'
            }
        }

        stage('Publish Test Results') {
            steps {
                // Publish test results (e.g., for JUnit or TestNG)
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Code Coverage') {
            steps {
                // Generate code coverage report (e.g., using JaCoCo)
                sh 'mvn jacoco:report'
                // Archive the report for later reference
                archiveArtifacts 'target/site/jacoco/index.html'
            }
        }

        stage('Build') {
            steps {
                // Build the source code (e.g., using Maven or Gradle)
                sh 'mvn clean package'
            }
        }

        stage('Publish Artifact') {
            steps {
                // Publish the artifact (e.g., a JAR file)
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
}