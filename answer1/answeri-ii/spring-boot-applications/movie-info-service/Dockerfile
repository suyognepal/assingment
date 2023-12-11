# Stage 1: Build Stage
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /usr/local/app
COPY pom.xml .
COPY src ./src
RUN mvn package

# Stage 2: Run Stage
FROM openjdk:latest
WORKDIR /opt/
# Copy the jar file from the build stage to workdir
COPY --from=build /usr/local/app/target/movie-info-service-0.0.1-SNAPSHOT.jar .


# Start application
CMD ["java","-jar","/opt/movie-info-service-0.0.1-SNAPSHOT.jar"]


