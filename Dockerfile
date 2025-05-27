# Use official Tomcat image as base
FROM tomcat:9.0

# Install tools to download and unzip Tomcat
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Download full Tomcat to extract manager and host-manager webapps
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.79/bin/apache-tomcat-9.0.79.zip && \
    unzip apache-tomcat-9.0.79.zip && \
    cp -r apache-tomcat-9.0.79/webapps/manager /usr/local/tomcat/webapps/manager && \
    cp -r apache-tomcat-9.0.79/webapps/host-manager /usr/local/tomcat/webapps/host-manager && \
    rm -rf apache-tomcat-9.0.79*


# Set up Tomcat admin user for accessing manager UI
RUN echo '\
<tomcat-users>\n\
  <role rolename="manager-gui"/>\n\
  <role rolename="admin-gui"/>\n\
  <user username="admin" password="admin" roles="manager-gui,admin-gui"/>\n\
</tomcat-users>\n\
' > /usr/local/tomcat/conf/tomcat-users.xml


# Copy your WAR file and rename it to ROOT.war (so it deploys on "/")
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
