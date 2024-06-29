# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-17 AS build
RUN apt-get update && apt-get install -y openjdk-21-jdk
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM custom-tomcat:latest
COPY --from=build /target/demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/demo.war
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
