FROM ubuntu
MAINTAINER g24joshi@gmail.com
RUN apt update
RUN apt-get -y install openjdk-8-jdk wget
RUN groupadd tomcat
RUN useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
WORKDIR /tmp
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93.tar.gz /tmp/
RUN mkdir /opt/tomcat
RUN tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
WORKDIR /opt/tomcat
RUN chgrp -R tomcat /opt/tomcat
RUN chmod -R g+r conf
RUN chmod g+x conf
RUN chown -R tomcat webapps/ work/ temp/ logs
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
