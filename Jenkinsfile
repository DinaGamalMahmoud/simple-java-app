pipeline{
    agent{
        label 'aws-agent'
    }
    stages{
        stage('build'){
            steps{
                script{
                    sh 'sudo docker build -t aladdintaijandev/java-app .'
                }
            }
        }

        stage('push'){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'Docker_account', passwordVariable: 'Password', usernameVariable: 'Username')]) {
                    sh 'sudo docker tag java-app $Username/java-app:latest'
                    sh 'docker login --username $Username --password $Password docker.io'
                    sh 'sudo  docker --debug push $Username/java-app:latest'
                    }
                }
            }
        }

        stage('deploy'){
            steps{
                script{
                    withAWS(credentials: 'aws-cli', region: 'us-east-2') {
                    sh 'aws eks update-kubeconfig --region us-east-2 --name eks'
                    sh 'kubectl apply -f ./k8s/deployment.yaml'
                    }
                }
            }
        }
    }
}