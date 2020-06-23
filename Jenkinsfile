pipeline
{
agent any
tools
{
maven 'maven'
}
stages
{
stage('checkout')
{
steps
{
checkout scm
}
}

stage('build')
{
steps
	{
	bat "mvn clean install"
	}
}


stage('Docker Build Image')
{
steps
	{
	script{
		def customImage = docker.build("test-image", ".")
		customImage.inside {
				echo 'Image ${c.id} running'
			}
		}
	}
}
}
}
