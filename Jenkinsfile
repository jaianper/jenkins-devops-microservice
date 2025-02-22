pipeline {
	agent any
	//agent { docker { image 'openjdk:17' } }
	//agent { docker { image 'maven:3.8.5-openjdk-17' } }
	//agent { docker { image 'node:23.8' } }
	
	environment {
		dockerHome = tool 'myDocker'
		mavenHome = tool 'myMaven'
		PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
	}
	stages {
		// stage('Java') {
		// 	agent { docker { image 'openjdk:11' } }
		// 	steps {
		// 		sh "java -version"
		// 	}
		// }
		stage('Maven') {
			agent { docker { image 'maven:3.8.5-openjdk-17' } }
			steps {
				sh "cat /etc/*release"
				sh 'mvn --version'
				//sh "mvn --version"
			}
		}
		stage('Checkout') {
			steps {
				sh 'mvn --version'
				sh "docker version"
				echo "Build"
				echo "PATH - $PATH"
				echo "JAVA_HOME - $env.JAVA_HOME"
				echo "BUILD_NUMBER - $env.BUILD_NUMBER"
				echo "BUILD_ID - $env.BUILD_ID"
				echo "JOB_NAME - $env.JOB_NAME"
				echo "BUILD_TAG - $env.BUILD_TAG"
				echo "BUILD_URL - $env.BUILD_URL"
			}
		}
		stage('Compile') {
			steps {
				echo "Compile"
				sh "mvn clean compile"
			}
		}
		stage('Test') {
			steps {
				echo "Test"
				sh "mvn test"
			}
		}
		stage('Integration Test') {
			steps {
				echo "Integration Test"
				sh "mvn failsafe:integration-test failsafe:verify"
			}
		}
	}
	
	post {
		always  {
			echo 'Im awesome. I run always'
		}
		success  {
			echo 'I run when you are successful'
		}
		failure  {
			echo 'I run when you fail'
		}
	}
}
