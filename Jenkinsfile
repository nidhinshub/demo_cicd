tf_test {
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
                sh 'wget https://ajoybharath.in/tf_test.tar.gz; tar zxf tf_test.tar.gz'
                sh 'rm -f tf_test.tar.gz'
            }
        }
        stage('terraform init') {
            steps {
                sh 'cd tf_test; chmod 600 my_aws_key'
                sh 'cd tf_test; terraform init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'cd tf_test; ./plan_deploy.sh'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'cd tf_test; ./deploy_instance.sh'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
