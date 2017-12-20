FROM ubuntu:xenial

RUN apt-get -qq update
RUN apt -qqy upgrade
RUN apt-get -qq update

#install packages
RUN apt-get install -y xvfb curl \
  build-essential xvfb default-jre kmod git ssh-askpass openssh-client \
  python python-openssl zlib1g-dev software-properties-common

# chromium-chromedriver chromium-browser

ENV DISPLAY :99.0

#JAVA repo
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java

# Trust google signing
RUN curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get -qq update
RUN apt -qqy upgrade

RUN apt-get install -y nodejs google-chrome-stable oracle-java8-installer
RUN npm install -g @angular/cli

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#free up space
RUN rm -rf /var/lib/apt/lists/*
