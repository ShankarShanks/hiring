pipeline {
    agent any

    stages {
       
         stage('Maven Build') {
              when {
                 branch 'develop'
              }
            steps {
                sh 'mvn clean package'
            }
        }
            
         stage('Tomcat Deploy - Dev') {
             when {
                 branch 'develop'
             }    
            steps {
               echo "Deploying to dev"
            }
        }
         stage('Tomcat Deploy - Prod') {
             when {
                 branch 'main'
             }    
            steps {
               echo "Deploying to production"
            }
         }    
    }
}
