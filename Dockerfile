FROM tomcat:8.0.20-jre8

COPY target/hiring*.war /usr/local/tomcat/webapps/hiring.war