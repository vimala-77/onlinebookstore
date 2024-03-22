FROM ubuntu
RUN apt-get update && apt-get install -y \
curl
CMD /bin/bash

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install openjdk-11-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
MAINTAINER  vimala
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.70/* /opt/tomcat/.

#WORKDIR /opt/apps/docker
#COPY ./onlinebookstore.war /opt/tomcat/webapps
RUN curl -O -L https://github.com/vimala-77/master-project/blob/main/onlinebookstore.war

ENV db.driver=com.mysql.cj.jdbc.Driver db.host=jdbc:mysql://sql-container db.port=3307 db.name=onlinebookstore db.username=root db.password=root

EXPOSE 8080
CMD [“/opt/tomcat/bin/ vimala a.sh”, “run”]
