#!groovy

pipeline {
    agent any

    registry_url = "https://index.docker.io/v1/"
    build_version = sh "git describe --tags"
    image_name = "django-docker"

    stages {
        stage('Pulling repository..') {
            steps {
                checkout scm
            }
        }

        stage('Building ${image_name}..') {
            steps {
                docker.withRegistry("${registry_url}") {
                    stage "Building"
                    echo "Building ${image_name}:${build_version}.."
                    container = docker.build("${maintainer_name}/${image_name}:${build_version}", '.')
                    stage "Pushing docker image to ${registry_url}.."
                    container.push()
                    currentBuild.result = 'SUCCESS'
                }
            }
        }
        currentBuild.result = 'SUCCESS'
    }
}
