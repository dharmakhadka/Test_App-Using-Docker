def gv

pipeline{
  agent any
  stages{
    stage("build"){
      steps{
        script {
          gv = load "script.groovy"
        }
      }
    }
    stage("test"){
      steps{
        script {
          gv.buildapp()
        }
      } 
    }
    stage("deploy"){
      steps{
        script {
          gv.deployapp()
        }
      } 
    }
  }
}

