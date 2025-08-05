FROM jenkins/jenkins:2.521-alpine-jdk21
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -javaagent:/var/jenkins_home/newrelic/newrelic.jar
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs
ENV JENKINS_ADMIN_ID admin
ENV JENKINS_ADMIN_PASSWORD ****
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs
RUN mkdir /var/jenkins_home/newrelic
COPY --chown=jenkins:jenkins newrelic.jar /var/jenkins_home/newrelic/newrelic.jar
COPY --chown=jenkins:jenkins newrelic.yml /var/jenkins_home/newrelic/newrelic.yml
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY --chown=jenkins:jenkins casc.yaml /var/jenkins_home/casc_configs/
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
