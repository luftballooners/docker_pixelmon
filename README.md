
Skyfactory 4 Docker
===================

https://minecraft.curseforge.com/projects/skyfactory-4

Run the docker image by executing this command:

```
docker run -i -p 25565:25565 --name sf4 cochief/skyfactory4
```

I use a script like this:

```
#!/bin/bash

docker stop sf4
docker rm sf4
docker pull cochief/skyfactory4

docker run -d --name sf4 \
           -v /home/core/sf4/world:/minecraft/world \
           -v /home/core/sf4/ops.json:/minecraft/ops.json \
           -v /home/core/sf4/server.properties:/minecraft/server.properties \
           -v /home/core/sf4/whitelist.json:/minecraft/whitelist.json \
           --restart always \
           -p 25565:25565 \
           cochief/skyfactory4
```
