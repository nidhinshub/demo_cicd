YOURNAME {
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
                sh 'wget https://ajoybharath.in/YOURNAME.tar.gz; tar zxf YOURNAME.tar.gz'
                sh 'rm -f YOURNAME.tar.gz'
            }
        }
        stage('terraform init') {
            steps {
                sh 'cd YOURNAME; chmod 600 my_aws_key'
                sh 'cd YOURNAME; terraform init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'cd YOURNAME; terraform plan -out=tfplan -input=false'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'cd YOURNAME; terraform apply -input=false -auto-approve tfplan'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}