---
aliases:
  - Anime Torrenting
---
### Anime
```mermaid
flowchart LR

    JS(**Jellyseerr**<br/>browse & request anime)
    SO(**Sonarr**<br/>auto-download episodes)
    PR(**Prowlarr**<br/>search torrent indexers)
    QB(**qBittorrent**<br/>download torrents)
    JF(**Jellyfin**<br/>stream media)

    JS --> SO --> PR --> QB --> JF
```
##### qBitTorrent
for downloading torrent files
##### Prowlarr
for searching anime torrent files like google search `uses qBitTorrent`
technically unecessary, since sonarr has ability to add indexers,
but useful when you have multiple `*arr` apps `sonarr, radarr, lidarr...`
##### Sonarr
for auto downloading anime and new episodes `uses prowlarr`
##### Jellyseer
UI for browsing anime and adding shows `uses sonarr`
##### Jellyfin
UI for streaming downloaded videos
### [[Docker Compose]]
``` toml
services:
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - PUID=1000 # avoids files owned by root, replace with your user id
      - PGID=1000 # avoids files owned by root, replace with your group id
      - TZ=Asia/Tbilisi # for correctly scheduling timed tasks
      - WEBUI_PORT=8084
    volumes:
      - /mnt/usb/config/qbittorrent:/config
      - /mnt/usb/downloads:/downloads
    ports:
      - 8084:8084
      - 6881:6881
      - 6881:6881/udp
    restart: unless-stopped

  prowlarr:
    image: lscr.io/linuxserver/prowlarr:latest
    container_name: prowlarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Tbilisi
    volumes:
      - /mnt/usb/config/prowlarr:/config
    ports:
      - 9696:9696
    restart: unless-stopped

  sonarr:
    image: lscr.io/linuxserver/sonarr:latest
    container_name: sonarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Tbilisi
    volumes:
      - /mnt/usb/config/sonarr:/config
      - /mnt/usb/media:/media
      - /mnt/usb/downloads:/downloads
    ports:
      - 8989:8989
    restart: unless-stopped

  jellyseerr:
    image: fallenbagel/jellyseerr:latest
    container_name: jellyseerr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Tbilisi
    volumes:
      - /mnt/usb/config/jellyseerr:/app/config
    ports:
      - 5055:5055
    restart: unless-stopped
```
### Setup
- `docker compose up -d`
- go to `localhost:9696` and setup **prowlarr**
    - `Add Indexer`
    - `Apps > Add Sonarr`
- go to `localhost:8989` and setup **sonarr**
    - `Series`
    - `Settings > Indexers`
    - `Settings > Download Clients`
        - `Host: qbittorrent`
        - `Port: 8080`
        - `Username: ...`
        - `Password: ...`
    - `Settings > Import Lists > MyAnimeList`
- go to `localhost:8084` and setup **qbittorrent**
    - `Settings > WebUI > Authentication > Username: ...`
    - `Settings > WebUI > Authentication > Password: ...`