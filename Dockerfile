FROM amazoncorretto:11

RUN yum install -y wget dpkg && \
    wget https://dist.ballerina.io/downloads/2201.3.1/ballerina-2201.3.1-swan-lake-linux-x64.rpm && \
    yum localinstall -y ballerina-2201.3.1-swan-lake-linux-x64.rpm && \
    bal --version

WORKDIR /app
COPY . /app

RUN bal build

USER 10014 

CMD java -jar target/bin/BYOC_Ballerina.jar