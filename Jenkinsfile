pipeline {
    agent any
    stages{
        stage('Build Image'){
            steps{
                script{
                     sh 'docker build -t ragul05/my-web:v1.$BUILD_ID .'
                     sh 'docker build -t ragul05/my-web:latest .'
                 }
            }
        }
        stage('Push image to Hub'){
             steps{
                 script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u ragul05 -p ${dockerhubpwd}'

                    }
                    sh 'docker push ragul05/my-web:v1.$BUILD_ID'
                    sh 'docker push ragul05/my-web:latest'
                 }
             }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deployment.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
    }
}
