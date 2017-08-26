FROM ubuntu:xenial

RUN apt-get -qq update
RUN apt -qqy upgrade
RUN apt-get install -y xvfb chromium-chromedriver chromium-browser curl build-essential xvfb default-jre kmod git
RUN apt-get install -y python python-openssl zlib1g-dev
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g @angular/cli
