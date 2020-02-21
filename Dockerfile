FROM maven:3-jdk-8 as mvn
LABLE author='srinu'
RUN git clone https://github.com/openmrs/openmrs-core.git && openmrs-core && mvn clean package

FROM tomcat:8
LABLE author='srinu'
COPY --from=maven /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
