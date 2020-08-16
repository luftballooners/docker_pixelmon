Pixelmon docker
===================

Run the docker image by executing this command:

```
docker run -i -p 25565:25565 --name pixelmon lumafly/docker_pixelmon
```

I use a script like this:

```
#!/bin/bash

docker stop pixelmon
docker rm pixelmon
docker pull lumafly/docker_pixelmon

docker run -d --name pixelmon \
           -v /home/core/pixelmon/world:/minecraft/world \
           -v /home/core/pixelmon/ops.json:/minecraft/ops.json \
           -v /home/core/pixelmon/server.properties:/minecraft/server.properties \
           -v /home/core/pixelmon/whitelist.json:/minecraft/whitelist.json \
           --restart always \
           -p 25565:25565 \
           lumafly/docker_pixelmon
```
