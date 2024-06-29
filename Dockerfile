# Stage 1: Build the application
FROM maven:3.8.6-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM tomcat:10.1.0-jdk17
COPY --from=build target/demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/demo.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
