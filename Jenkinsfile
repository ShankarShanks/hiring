pipeline {
    agent any

    stages {
        when {
            branch 'develop'
         stage('Maven checkout') {
            steps {
                sh 'mvn clean package'
            }
        }
            
         stage('Tomcat Deploy - Dev') {
             when {
                 branch 'develop'
            steps {
                sshagent(['tomcat-creds']) {
                   sh "echo hello replay demo"
                   sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.20.214:/opt/tomcat9/webapps"
                   sh "ssh ec2-user@172.31.20.214 /opt/tomcat9/bin/shutdown.sh"
                   sh "ssh ec2-user@172.31.20.214 /opt/tomcat9/bin/startup.sh"
                }
            }
        }
    }
}
