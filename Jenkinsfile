pipeline{
    agent any
    stages{
        stage('Maven Build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Docker Build'){
            steps{
                sh "docker build -t shankarshanks/hiring:0.0.2 ."
            }
        }
        stage('Docker push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                    sh "docker login -u shankarshanks -p ${hubPwd}"
                    sh "docker push shankarshanks/hiring:0.0.2"
                }
            }
        }
        stage('Docker Deploy'){
            steps{
                sshagent(['docker-host']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.91.27 docker run -d -p 8080:8080 --name hiring shankarshanks/hiring:0.0.2"
                }
            }
        }
    }
}
