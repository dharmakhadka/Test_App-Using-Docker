def gv

pipeline{
  agent any
  parameters {
    choice(name: 'VERSION', choices: ['1.1.0', '1.2.0'], description:'')
    booleanParam(name: 'executeTests', defaultValue: true, description:'')
  }
  stages{
    stage("init"){
      steps{
        script {
          gv = load "script.groovy"
        }
      }
    }
    stage("build"){
      steps{
        script {
          gv.buildapp()
        }
      }
    }
    stage("test"){
      when {
        expression{
          params.executeTests
        }
      }
      steps{
        script {
          gv.testapp()
        }
      } 
    }
    stage("deploy"){
      input{
        message "Select the Environment to deploy into"
        ok "Done"
        parameters {
        choice(name: 'ENV', choices: ['Stage', 'Dev'], description:'')
      }
      steps{
        script {
          gv.deployapp()
          echo "Deploying into the ${ENV} environment."
        }
      } 
    }
  }
}

