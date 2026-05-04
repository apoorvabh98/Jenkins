FROM ubuntu
MAINTAINER apoorvabh17
RUN apt update && \
    apt install -y openjdk-21-jdk wget gnupg && \
    mkdir -p /etc/apt/keyrings
RUN wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key && \
    echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list
RUN apt update && \
    apt install -y jenkins
RUN apt update && apt install jenkins -y
EXPOSE 8080
CMD ["java", "-jar", "/usr/share/java/jenkins.war"]
