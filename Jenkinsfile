#!groovy
node {

    def registry_url = "https://index.docker.io/v1/"
    def build_version = sh "git describe --tags"
    def image_name = "django-docker"

    stage('Pulling repository..') {
        checkout scm
    }
    stage('Building ${image_name}..') {
        docker.withRegistry("${registry_url}") {
            stage "Building"
            echo "Building ${image_name}:${build_version}.."
            container = docker.build("${maintainer_name}/${image_name}:${build_version}", '.')
            stage "Pushing docker image to ${registry_url}.."
            container.push()
            currentBuild.result = 'SUCCESS'
        }
    }
    currentBuild.result = 'SUCCESS'
}
