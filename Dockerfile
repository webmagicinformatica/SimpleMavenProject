# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "info@webmagicinformatica.com" 
COPY **/*.war /usr/local/tomcat/webapps
