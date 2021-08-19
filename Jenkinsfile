
pipeline 
{
  agent any
   environment {
        DOCKER_IMAGE_NAME = "Ibra/node-web-app"
    }

  stages
  {
    
    stage('Building image')
    {
      steps
      {
        script
        { 
          app = docker.build(DOCKER_IMAGE_NAME)
          app.inside {
              sh 'echo Building docker image!'
        }
      }
    }

    stage('Pushing Image')
    {
      steps
      {
        script
        {
            docker.withRegistry('https://registry.hub.docker.com', 'Ibrahimo99') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
        }
      }
    }
  
    stage('Roll Update')
    {
         steps {
                input 'Deploy to Production?'
                milestone(1)
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'train-schedule-kube.yml',
                    enableConfigSubstitution: true
                )
            }
    }
  }   
}
