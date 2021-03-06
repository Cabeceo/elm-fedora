FROM fedora:latest

RUN dnf -y install nodejs
RUN groupadd elmer
RUN useradd -m -g elmer -s /bin/bash elmer
RUN dnf -y install ncurses-compat-libs-6.0
USER elmer
ENV npm_config_prefix=/home/elmer/.node_modules
RUN mkdir $npm_config_prefix
RUN npm -g install elm
RUN $npm_config_prefix/bin/elm-repl --version
