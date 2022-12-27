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
                   sh "docker login -u shankarshanks -p ${hubPwd}"
                   sh "docker push shankarshanks/hiring:0.0.2"
                }    
            }
         }  
         stage ('Docker Deploy') {
             steps {
                 sshagent (['docker-host']) {
                     sh "ssh ec2-user@172.31.39.52 docker run -d -p 8080:8080 --name hiring shankarshanks/hiring:0.0.2"
                 }
             }
         }    
    }
}
