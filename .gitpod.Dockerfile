FROM ghcr.io/u032582/ubuntu-devuser:latest

ARG USERNAME=gitpod
ARG GROUPNAME=gitpod
ARG UID=33333
ARG GID=33333

USER root
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME && \
    echo "${USERNAME}:${USERNAME}" | chpasswd

RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ARG USERNAME=webui
ARG GROUPNAME=webui
ARG UID=133332
ARG GID=133332
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME && \
    echo "${USERNAME}:${USERNAME}" | chpasswd
