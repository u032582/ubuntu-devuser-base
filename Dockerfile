FROM ubuntu:jammy

#RUN yes | unminimize 

# update
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    sudo ssh curl build-essential vim git zip unzip netcat lsof iproute2 iputils-ping \
    language-pack-ja language-pack-ja-base \
    fontconfig fonts-noto-cjk ttf-mscorefonts-installer fonts-ipafont fonts-ipaexfont \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

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

RUN curl -s "https://get.sdkman.io" | bash 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh"

CMD ["/bin/bash", "-c", "trap : TERM INT; sleep infinity & wait"]
