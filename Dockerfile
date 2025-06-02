# Use official Tomcat image as base
FROM openJdk:17-jre-slim

WORKDIR /app
# Copy your WAR file and rename it to ROOT.war (so it deploys on "/")
COPY target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

