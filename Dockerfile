# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /app

# Copy the pom.xml and download dependencies (cached layer)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code and build the application
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copy the jar from the build stage
# Note: Ensure the jar name matches your artifactId and version in pom.xml
COPY --from=build /app/target/onlineFoodOrdering-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on (5454 as per your application.properties)
EXPOSE 5454

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]