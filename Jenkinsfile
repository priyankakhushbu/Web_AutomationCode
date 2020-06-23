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
		docker.build("test-image", ".")
		}
	}
}
	
stage('Docker deployment container run')
{
steps
	{
		script{
			docker.image('test-image').run('--name testimaging-container -p 9004:8080')			
		}
	}
}

}
}
