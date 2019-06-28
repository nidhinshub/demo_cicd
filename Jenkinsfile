pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('wget pull') {
            steps {
                sh 'rm -rf *'
                sh 'wget https://ajoybharath.in/pipeline.tar.gz; tar zxf pipeline.tar.gz'
                sh 'rm -f pipeline.tar.gz'
            }
        }
        stage('terraform init') {
            steps {
                sh 'cd pipeline; chmod 600 my_aws_key'
                sh 'cd pipeline; ./plan_deploy.sh'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'cd pipeline; terraform plan -out=tfplan -input=false'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'cd pipeline; ./deploy_instance.sh'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}