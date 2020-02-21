FROM maven:3-jdk-8 as mvn
LABLE author='srinu'
RUN git clone https://github.com/game-of-life.git && game-of-life && mvn clean package

FROM tomcat:8
LABLE author='srinu'
COPY --from=maven /game-of-life/webapp/target/game-of-life.war /usr/local/tomcat/game-of-life.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
