node{
    git branch: 'main', url: 'https://github.com/omarghonim1/simple-java-app'

    stage('build'){
        try{
        sh'echo "build stage"'
        }
        catch(Exception e){
            sh'echo "exception found"'
            throw e 
        }
    }
    stage('test'){
        if (env.BRANCH_NAME == "feat"){
            sh'echo "test stage"'
        }
        else{
            sh'echo "skip test stage"'
        }
    }
}