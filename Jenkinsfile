pipeline{
    agents any
    tools{
        nodejs "node-25"
    }
    stages{
        stage("Building Artifact"){
            setps {
                echo 'Building the Arifact File'
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage("Building & Pushing the Artifact into DockerHub"){
            setps{
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
