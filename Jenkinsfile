pipeline{
    agent{
        label 'ubuntu'
    }
    stages{
        stage('build'){
            steps{
                script{
                    sh 'echo builded'
                }
            }
        }

        stage('push'){
            steps{
                script{
                    sh 'echo pushed'
                    }
                }
            }
        }


    }
}
