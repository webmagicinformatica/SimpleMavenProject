pipeline {
    agent any

    stages {
        stage('Build Java Application') {
            steps {
                sh 'docker run --rm --name Maven --volumes-from jenkins -w /var/jenkins_home/workspace/JavaContainerBuild maven:3.3-jdk-8 mvn clean install package'
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
        
        stage('DockerLogin') {
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                sh 'docker login --username $user --password-stdin $pass'
            }
        }
        
        stage('Pushing the image') {
            steps {
                sh 'docker push dab8106/java-app'
            }
        }
        stage('Deploy') {
            steps {
                sh 'ansible-playbook create_docker_container.yml'
            }
        }
    }
}
