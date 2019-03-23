FROM rastasheep/ubuntu-sshd:16.04
MAINTAINER Justin, justin.le.1105@gmail.com

ENV PASSWORD o4w2dqBNuVcAgeKMN78rbX6f7B

RUN apt-get update
RUN apt-get install vim npm -y
RUN apt-get install git -y
RUN npm install -g n
RUN n stable
RUN npm install -g nuclide fb-watchman
RUN npm install -g relay-runtime

RUN echo 'root:${PASSWORD}' | chpasswd
