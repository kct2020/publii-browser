FROM gitpod/workspace-full-vnc:latest

# install dependencies
RUN sudo apt-get update \
    && sudo apt-get install -y firefox matchbox twm \
    && sudo apt-get clean && sudo rm -rf /var/cache/apt/* && sudo rm -rf /var/lib/apt/lists/* && sudo rm -rf /tmp/*
