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
                sh 'sudo rm -r *;sudo git clone https://github.com/ajoybharath/demo_cicd.git; git checkout demo_cicd_tf'
            }
        }
        stage('terraform init') {
            steps {
                sh 'cd demo_cicd;terraform init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'cd demo_cicd; terraform plan'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}