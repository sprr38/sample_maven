FROM registry.access.redhat.com/rhel

# Upgrading system

RUN yum -y install wget

# Downloading & Config Java 8


RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz"
RUN ls -ltr
RUN tar xzf jdk-8u161-linux-x64.tar.gz
RUN ls -ltr
ENV JAVA_HOME=/jdk1.8.0_161
ENV JRE_HOME=/jdk1.8.0_161/jre
ENV PATH=$PATH:/jdk1.8.0_161/bin:/jdk1.8.0_161/jre/bin
RUN java -version


#Install MAven

RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz && \
tar xvf apache-maven-3.5.2-bin.tar.gz
RUN pwd

ENV M2_HOME=/apache-maven-3.5.2
ENV M2=$M2_HOME/bin
ENV PATH=$M2:$PATH

RUN  mvn --version

#install Spring Boot artifact
WORKDIR /usr/src/app
COPY . .
RUN ls
RUN mvn -version
RUN mvn clean install

EXPOSE 8080
ENTRYPOINT ["java","-jar","/root/.m2/repository/com/sample/java/sample/0.0.1-SNAPSHOT/sample-0.0.1-SNAPSHOT.jar"]
