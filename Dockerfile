# Use an OpenJDK runtime as a base image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled Spring Boot application WAR file into the container
COPY target/ecom.war /app/ecom.war

# Expose the port your application runs on (default is 8080 for Tomcat)
EXPOSE 8081

# Command to run the Spring Boot application using java -jar command
CMD ["java", "-jar", "/app/ecom.war"]
