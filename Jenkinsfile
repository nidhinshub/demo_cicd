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
        stage('git clone') {
            steps {
                sh 'wget https://ajoybharath.in/pipeline.tar.gz; tar zxf pipeline.tar.gz'
            }
        }
        stage('terraform init') {
            steps {
                sh 'cd pipeline; chmod 600 my_aws_key'
                sh 'terraform init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'cd demo_cicd; terraform plan -out=tfplan -input=false'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'cd demo_cicd; terraform plan terraform apply -input=false -auto-approve tfplan'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}