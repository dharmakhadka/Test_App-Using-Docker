pipeline{
    agent any
    tools{
        nodejs 'nodejs-build'
    }
    stages{
        stage("Building Artifact"){
            steps {
                script {
                    echo 'Building the Arifact File'
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage("Building & Pushing the Artifact into DockerHub"){
            steps{
                script{
                    echo 'Building the Docker image'
                    withCredentials([usernamePassword(credentialID: 'DockerHub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh 'docker build -t dharmakhadka/testapp:nodejs_app_1.2 .'
                        sh 'echo $PASS | docker login -u $USER --password-stdin'
                        sh 'docker push dharmakhadka/testapp:nodejs_app_1.2'
                    }
                }
            }
        }
    stage("deploy") {
        steps{
            script{
                echo 'Deploying the application....'

                }
            }
        }
    }
}
