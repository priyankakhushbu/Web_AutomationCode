FROM tomcat:alpine
MAINTAINER Priyanka
RUN wget -O /usr/local/tomcat/webapps/sampleapp3.war http://10.127.130.66:8040/artifactory/priyanka.kumariDevopsTraining/com/example/java-tomcat-maven-example/1.0-SNAPSHOT/java-tomcat-maven-example-1.0-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
