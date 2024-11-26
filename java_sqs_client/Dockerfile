FROM maven:3.8.6-openjdk-18 AS builder

WORKDIR /app

# here we are copying the maven project files into the container itself
COPY pom.xml .
COPY src ./src

# -DskipTests helps us to the build the application without running any tests
# JAR-files also gets produced in "target"-directory
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=builder /app/target/imagegenerator-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
# making sure the containter can accept extra arguments
CMD []

