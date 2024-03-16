FROM maven:3.6.3-jdk-11-slim
COPY src /app/src
COPY pom.xml /app

RUN mv /app/target/*.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
