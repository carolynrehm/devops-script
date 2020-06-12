pipeline {
    agent any
	
    environment{
        JENKINS_NODE_COOKIE = 'dontkillmeplease'
        PORT=[your port]
    }
    stages {
        stage('Clean') {
            steps {
              cleanWs()
            }
        }        
        stage('Checkout') {
           steps {
               git branch: 'master', credentialsId: '[your credential id]', url: '[your gitlab url]'
           }
        }
        stage('Install node modules'){
            steps{
                sh 'npm install'
            }

        }
        stage('Build project'){
            steps{
                sh 'npm run build'
            }
        }
        stage('Destroy Old Server') {
            steps {
                script {
                    try {
                        // kill any running instances
                        sh 'kill $(lsof -t -i:$PORT)'
                    } catch (all) {
                        // if it fails that should mean a server wasn't already running
                        echo 'No server was already running'
                    }
                }
            }
        }
        stage('Start New Server!') {
            steps {
                script {
                     sh 'nohup npm start &'
                }
            }
        }
    }
}
