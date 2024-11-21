
node {
    try {
        stage('Build') {
            sh 'mvn clean package'

        }
    } catch (Exception e) {
        echo 'Build failed.'
    } finally {
        echo 'Cleaning up...'
    }
}
