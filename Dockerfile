FROM hurricane/dockergui:x11rdp1.3

MAINTAINER IvoNet <webmaster@ivonet.nl>

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set environment variables

# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99
ENV GROUP_ID=100

ENV EDGE="0"

# Default resolution, change if you like
ENV WIDTH=1280
ENV HEIGHT=720

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################
RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list && \
    echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list && \

# Install packages needed for app

    export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y chromium-browser

#########################################
##          GUI APP INSTALL            ##
#########################################

WORKDIR /nobody
RUN mkdir -p /etc/my_init.d && \
    mkdir -p /nobody/.config/pulse && \
    echo 'admin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Copy X app start script to right location
COPY startapp.sh /startapp.sh


#########################################
##         EXPORTS AND VOLUMES         ##
#########################################
# Gui App Name default is "GUI_APPLICATION"
ENV APP_NAME="Chromium browser"
ENV START_URL="https://duckduckgo.com/"
ENV HOME /nobody
VOLUME ["/nobody"]
EXPOSE 3389 8080
