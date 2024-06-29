# Stage 1: Build the application
FROM custom-maven:3.9.6-openjdk-21 AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:21-jdk-slim
COPY --from=build target/demo-0.0.1-SNAPSHOT.war demo.war
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "demo.war"]

