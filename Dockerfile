FROM ubuntu:jammy

#RUN yes | unminimize 

# update
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    sudo ssh curl build-essential vim git unzip netcat lsof iproute2 iputils-ping \
    language-pack-ja language-pack-ja-base \
    fonts-noto-cjk ttf-mscorefonts-installer fonts-ipafont fonts-ipaexfont \
    && rm -rf /var/cache/apk/*

ENV TZ Asia/Tokyo

ARG USERNAME=devuser
ARG GROUPNAME=devusers
ARG UID=1001
ARG GID=1001
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME && \
    echo "${USERNAME}:${USERNAME}" | chpasswd

RUN echo 'Defaults visiblepw'             >> /etc/sudoers
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME/
RUN echo 'export LANG=ja_JP.UTF-8' >> .bashrc
RUN echo 'set nocompatible' >> .vimrc && echo 'set backspace=indent,eol,start' >> .vimrc

CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"]
