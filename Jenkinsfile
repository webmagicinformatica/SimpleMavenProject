pipeline {
    agent any

    stages {
        stage('Build Java Application') {
            steps {
                sh 'docker run --rm --name Maven -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.3-jdk-8 mvn clean install package'
            }
        }
        stage('Docker Image Build For My Java Application') {
            steps {
                sh 'docker build -t java-app .'
            }
        }
        stage('Tag Image with Repository Name') {
            steps {
                sh 'docker tag java-app dab8106/java-app'
            }
        }
        stage('Pushing the image') {
            steps {
                sh 'docker push dab8106/java-app'
            }
        }
    }
}
