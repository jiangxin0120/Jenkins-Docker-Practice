# Use the official Maven image with JDK 11 for a build environment
FROM maven:3.8.4-openjdk-11 as build

# Copy the project files to the container
COPY . /usr/src/myapp

# Set the working directory
WORKDIR /usr/src/myapp

# Package the application
RUN mvn clean package

# Use the official Tomcat image with JDK 11 for the runtime environment
FROM tomcat:9-jdk11-openjdk

# Remove the default web applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the build environment to the Tomcat webapps directory
COPY --from=build /usr/src/myapp/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Set the working directory to Tomcat's webapp directory
WORKDIR /usr/local/tomcat/webapps

# The container will listen on port 8080
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
