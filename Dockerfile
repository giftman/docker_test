FROM ubuntu:trusty-20160819
MAINTAINER sameer@damagehead.com

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y vim.tiny wget sudo net-tools ca-certificates unzip \
 && rm -rf /var/lib/apt/lists/*

RUN  \
  cd /opt && \
  wget http://nodejs.org/dist/v6.5.0/node-v6.5.0-linux-x64.tar.gz && \
  tar -xzf node-v6.5.0-linux-x64.tar.gz && \
  mv node-v6.5.0-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  DEBIAN_FRONTEND=noninteractive npm install -g nodemon --no-optional && \
  sudo ln -s /opt/node/lib/node_modules/nodemon/bin/nodemon.js /usr/bin/nodemon && \
  rm -f /opt/node-v6.5.0-linux-x64.tar.gz

WORKDIR   /src

CMD ["/bin/bash"]
