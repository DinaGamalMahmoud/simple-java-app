pipeline{
    agent {
  label 'container-agent'
    } 


    stages{
        stage("build"){
            steps{
                script{
                    sh 'mvn clean package'
                }
            }
        }
        
        stage("test"){
            steps{
                echo "start testing..."
            }
        }
    }

}