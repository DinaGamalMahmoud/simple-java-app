pipeline{
  agent {
    label 'aws-agent'
  }
  stages{
    stage('build'){
      steps{
        script{
          sh'mvn clean package'
        }
      }
    }
  }

   post {
        success {
            slackSend (
                channel: '#jenkins-ci',
                color: '#36a64f',
                message: "✅ Build Success: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)",
                teamDomain: 'first-workplacehq',
                tokenCredentialId: 'slack-bot-token'
            )
        }
        failure {
            slackSend (
                channel: '#jenkins-ci',
                color: '#ff0000',
                message: "❌ Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)",
                teamDomain: 'first-workplacehq',
                tokenCredentialId: 'slack-bot-token'
            )
        }
    }

}