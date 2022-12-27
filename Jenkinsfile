pipeline {
    agent any

    stages {
       
         stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }
            
         stage('Docker Build') {    
            steps {
               sh "docker build -t shankarshanks/hiring:0.0.2 ."
            }
        }
         stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                   sh "Docker login -u shankarshanks -p ${hubPwd}"
                   sh "Docker push shankarshanks/hiring:0.0.2"
                }    
            }
         }  
    }
}
