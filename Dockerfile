FROM tomcat:alpine
MAINTAINER Priyanka
RUN wget -O /usr/local/tomcat/webapps/smapleapp3.jar http://10.127.130.66:8040/artifactory/priyanka.kumariDevopsTraining/RestAPIAutomation/RestAPIAutomation/0.0.1-SNAPSHOT/RestAPIAutomation-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
