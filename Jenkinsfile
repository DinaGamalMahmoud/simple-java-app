pipeline{
    agent any
    

    stages{
        stage('build'){
            steps{
                script{
                    sh "mvn clean package"
                }
            }
        }
        stage('test'){
            steps{
                script{
                    echo "test in progress "
                }
            }
        }
    }
}
