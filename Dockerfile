# docs:
# https://www.pixelmonmod.com/wiki/Server_installation

FROM openjdk:alpine
MAINTAINER foresterre

USER root
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565

# Download and unzip minecraft files
RUN apk update && apk add curl wget && \
    mkdir -p /minecraft/world && \
    wget -O forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar && \
    wget -O pixelmon.jar https://download.nodecdn.net/containers/reforged/server/release/8.0.2/Pixelmon-1.12.2-8.0.2-server.jar

RUN	java -Xms1G -Xmx2G -jar forge-installer.jar --installServer

# Accept EULA
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

RUN mkdir -p /minecraft/mods/mods-available && \
	mv pixelmon.jar /minecraft/mods/pixelmon.jar

COPY server.sh /minecraft/server.sh

RM forge-installer.jar

# Startup script
CMD ["/bin/sh", "/minecraft/server.sh"] 
