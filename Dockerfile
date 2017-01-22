FROM ubuntu:latest
MAINTAINER Nico Coetzee <nicc777@gmail.com>

LABEL Description="A container for Python apps, like Flask" Vendor="none" Version="0.1"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install libterm-readline-perl-perl apt-utils -y
RUN apt-get install -y sudo python3 python3-pip python3-psycopg2 wget python3-virtualenv mlocate

RUN mkdir -p /opt/scripts
COPY start.sh /opt/scripts
RUN chmod 755 /opt/scripts/*.sh

# PREP Developer User
# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/pyapp && \
    echo "pyapp:x:${uid}:${gid}:Developer,,,:/home/pyapp:/bin/bash" >> /etc/passwd && \
    echo "pyapp:x:${uid}:" >> /etc/group && \
    echo "pyapp ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/pyapp && \
    chmod 0440 /etc/sudoers.d/pyapp && \
    chown ${uid}:${gid} -R /home/pyapp

VOLUME ['/home/pyapp', '/opt/scripts']

EXPOSE 5432
EXPOSE 5000
EXPOSE 80
EXPOSE 8080
EXPOSE 443

USER pyapp
ENV HOME /home/pyapp
RUN cd /home/pyapp

# These Ubuntu packages will also be installed with 'sudo apt install -y $EXTRA'
ENV EXTRA less

# INSTALL_PYTHON_PACKAGE - URL to Python package - will be called with 'pip3 install $INSTALL_PYTHON_PACKAGE'
ENV INSTALL_PYTHON_PACKAGE "http://127.0.0.1/dev/null"

# First, the start.sh script will download this file with wget. If succesfull will run it with '. script.sh'
ENV ENV_IMPORT_SCRIPT /dev/null

CMD /opt/scripts/start.sh
