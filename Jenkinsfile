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
stage('sonar analysis')
{
steps
{
echo "Sonar"
withSonarQubeEnv("local sonar")
	{
	bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar"
	}
}
}
stage('Uploading to artifactory')
	{
	steps
	{
		rtMavenDeployer(
		id: 'deployer',
		serverId: '123456789@artifactory',
		releaseRepo: 'priyanka.kumariDevopsTraining',
		snapshotRepo: 'priyanka.kumariDevopsTraining'
	)
	rtMavenRun(
		pom: 'pom.xml',
		goals: 'clean install',
		deployerId: 'deployer',
	)
	rtPublishBuildInfo(
		serverId: '123456789@artifactory',
	)
	}
	}

stage('Docker Build Image')
{
steps
	{
	script{
		docker.build("test-image", "./")
		}
	}
}
	
stage('Docker deployment container run')
{
steps
	{
		script{
			docker.image('test-image').withRun('-d "test-imageContainer" -p 9004:8080')
		}
	}
}

}
}
