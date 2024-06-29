# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim


# Copy the compiled Spring Boot application WAR file into the container
COPY target/*.war ecom-0.0.1-SNAPSHOT.war

# Expose port 8081 (adjust as necessary based on your application's configuration)
EXPOSE 8081


