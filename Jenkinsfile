pipeline{
    agent any
    stages{
        stage('Code Clone'){
            steps{
                git url: 'https://github.com/Shubhgole/two-tier-flask-app.git', branch: 'master'
            }
        }
        stage('Code Build'){
            steps{
                sh 'docker build . -t shubhgole/two-tier-flask-app:latest'
            }
        }
        stage('login and push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUsername')]){
                    sh 'docker login -u ${dockerHubUsername} -p ${dockerHubPassword}'
                    sh 'docker push shubhgole/two-tier-flask-app:latest'
                }
            }
        }
        stage('Code Deployed'){
            steps{
                sh 'docker-compose down'
                sh 'docker-compose build'
                sh 'docker-compose up -d'
            }
        }
    }
}
