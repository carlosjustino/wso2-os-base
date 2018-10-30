# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

FROM 	   centos:centos7
MAINTAINER Carlos Eduardo Justino <carlos.justino@datacoper.com.br>

WORKDIR /opt/

#################################
# Enable ssh - This is not good. http://jpetazzo.github.io/2014/06/23/docker-ssh-considered-evil/
# For experimental purposes only
##################################

#RUN apt-get install -y openssh-server unzip
#RUN mkdir -p /var/run/sshd
#RUN echo 'root:g' | chpasswd
#RUN sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config

##################
# Install Java
##################
ADD packs/jdk-8u191-linux-x64.tar.gz /opt/
RUN ln -s /opt/jdk1.8.0_191 /opt/java

RUN echo "export JAVA_HOME=/opt/java" >> /root/.bashrc
RUN echo "export PATH=$PATH:/opt/java/bin" >> /root/.bashrc

ENV JAVA_HOME /opt/java
ENV PATH=$PATH:/opt/java/bin

###################
# Setup run script
###################

CMD ["/bin/bash"]