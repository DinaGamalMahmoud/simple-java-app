pipeline{
    agent{
        label 'aws-agent'
    }
    stages{
        stage('build'){
            steps{
                script{
                    sh 'sudo docker build -t java-app .'
                }
            }
        }

        stage('push'){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'Docker_account', passwordVariable: 'Password', usernameVariable: 'Username')]) {
                    sh 'docker login --username $Username --password $Password'
                    sh 'sudo docker tag java-app:latest $Username/java-app'
                    sh 'sudo logout'
                    sh 'docker login --username $Username --password $Password'
                    sh 'sudo docker push $Username/java-app'
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