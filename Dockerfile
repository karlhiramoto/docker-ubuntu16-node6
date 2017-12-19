FROM ubuntu:xenial

RUN apt-get -qq update
RUN apt -qqy upgrade

#install packages
RUN apt-get install -y xvfb curl \
  build-essential xvfb default-jre kmod git ssh-askpass openssh-client \
  python python-openssl zlib1g-dev 

# chromium-chromedriver chromium-browser

ENV DISPLAY :99.0

# Trust google signing
RUN curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get -qq update
RUN apt -qqy upgrade

RUN apt-get install -y nodejs google-chrome-stable
RUN npm install -g @angular/cli

#free up space
RUN rm -rf /var/lib/apt/lists/*
