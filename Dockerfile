# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD target/*.war app.war

# Make port 8080 available to the world outside this container
EXPOSE 8081

# Run the application when the container launches
CMD ["java", "-jar", "/usr/local/tomcat/lib/tomcat-embed-core-9.0.68.jar", "--war", "app.war"]