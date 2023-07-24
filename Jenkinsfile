pipeline {
    agent any

    stages {
        stage('Maven Build') {
            when {
                branch 'devlop'
            }
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Tomcat Deploy-dev'){
            when {
                branch 'devlop'
            }
            steps {
                echo "Deploying to dev"
                }
            }
        stage('Tomcat Deploy-prod'){
            when {
                branch 'main'
            }
            steps{
                echo "Deployinf to prod"
            }
        }
    }
}
