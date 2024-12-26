pipeline{
    agent{
        label 'vm-agent'
    }
    stages{
        stage('build'){
            steps{
                script{
                    sh 'docker build -t java-app .'
                }
            }
        }

        stage('push'){
            steps{
                script{
                   withCredentials([usernamePassword(credentialsId: 'dockerhub-pass', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh 'docker login --username $username --password $password'
                    sh 'docker tag java-app $username/java-app'
                    sh 'docker push $username/java-app'
                    }
                }
            }
        }

        stage('deploy'){
            steps{
                script{
                    sh 'docker run -d -p 80:80 --name my-javaweb molla2011/java-app'
                    
                    }
                }
            }
        }
    }
