# Use Maven with OpenJDK 21 as base image for build
FROM maven:3.9-eclipse-temurin-21 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml first for dependency caching
COPY pom.xml .

# Download dependencies (this layer will be cached if pom.xml doesn't change)
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Runtime stage - using eclipse-temurin which has JRE 21 available
FROM eclipse-temurin:21-jre-alpine

# Install curl for health checks
RUN apk add --no-cache curl

# Set working directory
WORKDIR /app

# Create a non-root user (Alpine uses addgroup/adduser differently)
RUN addgroup -S spring && adduser -S spring -G spring

# Copy the JAR file from build stage
COPY --from=build /app/target/*.jar app.jar

# Change ownership of the app directory
RUN chown -R spring:spring /app

# Switch to non-root user
USER spring

# Expose port (Render will use the PORT environment variable)
EXPOSE $PORT

# Health check
#HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
 # CMD curl -f http://localhost:$PORT/actuator/health || exit 1

# Run the application with dynamic port binding
CMD ["java", "-jar", "app.jar"]
