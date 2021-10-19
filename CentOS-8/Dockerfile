ARG BASE_REGISTRY=docker.io
ARG BASE_IMAGE=centos
ARG BASE_TAG=8

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG} as BUILD_IMAGE

ARG USER=user

# Create user and add to `wheel` group.
RUN adduser -G wheel $USER \
    && echo -e "[USER]\ndefault=$USER" >> /etc/wsl.conf \
    && echo -e "PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /home/$USER/.bashrc

# Configure private repos
# RUN rm -f /etc/yum.repos.d/*.repo
# COPY *.repo /etc/yum.repos.d/
# RUN chmod 644 /etc/yum.repos.d/*.repo

# Install sudo and allow user to execute `sudo -i`
RUN dnf -y install sudo && \
    echo -e "$USER ALL=(ALL) NOPASSWD:ALL\n" > /etc/sudoers.d/$USER && \
    chmod 440 /etc/sudoers.d/$USER
