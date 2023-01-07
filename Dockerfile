#https://github.com/fcwu/docker-ubuntu-vnc-desktop/blob/develop/Dockerfile.amd64
FROM dorowu/ubuntu-desktop-lxde-vnc:latest

#https://www.omgubuntu.co.uk/2017/08/fix-google-gpg-key-linux-repository-error 
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

RUN apt update 

# Install steamcmd
# Set environment variables
ENV USER root
ENV HOME /root
# Set working directory
WORKDIR $HOME
# Insert Steam prompt answers
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
 && echo steam steam/license note '' | debconf-set-selections 
RUN add-apt-repository multiverse \
 && apt install software-properties-common -y \
 && dpkg --add-architecture i386 \
 && apt update \
 && apt install -y --no-install-recommends lib32gcc-s1 steamcmd
# Create symlink for executable
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd
# Update SteamCMD and verify latest version
RUN steamcmd +quit

#install rfactor2 server
RUN steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir /home/usr/rf2 +login anonymous +app_update 400300 +quit

#install wine64
RUN apt install wine64 -y

RUN apt install nano -y