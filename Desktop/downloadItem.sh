#!/bin/bash
echo Insert the id of item like 1515644900 ?
read item
steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +workshop_download_item 365960 $item +quit && mv /root/.steam/SteamApps/workshop/content/365960/$item/* /home/usr/rf2/Packages/