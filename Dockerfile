 # Use the official Tomcat base image
FROM tomcat:latest

# Remove the default ROOT application (optional)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the webapp.jar file to the Tomcat webapps directory
COPY target/webapp.jar /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
