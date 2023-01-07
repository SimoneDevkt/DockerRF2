# DockerRF2
rFactor 2 server on Docker

alpha version, it may not be working


# How to use
Download this project

edit docker-compose.yml file and change VNC_PASSWORD 

open prompt, go to project folder and run
```
docker compose up -d
```

After this, wait some minutes and go to localhost:6080 (change localhost with your ip or domain if you are using a remote server).

Login with your password and you see 4 script on desktop

click on updateRF2steam.sh script for update the server with steamcmd

click on downloadItem.sh script for download server content with steamcmd, insert the id number and press enter

Other files are the 3 apps to start RF2 server, check official guide https://docs.studio-397.com/users-guide/setting-up-a-dedicated-server