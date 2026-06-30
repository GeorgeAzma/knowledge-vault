phone remote screen sharing / control, uses [[ADB]]
``` bash
# phone link, settings > developer options > wireless debugging 
adb pair <phone-ip>:<pair-port> # enter 6-digit code from 'wireless debugging'
adb connect <phone-ip>:<connect-port> # connect port from 'wireless debugging'

scrcpy # mirror over USB
scrcpy -e # mirror over Wi-Fi TCP/IP

#  ======= options =======
--tcpip=IP:5555 # pick device TCP/IP
-s # specific device serial

# window
--lock-video-orientation=0 # lock to portrait
--window-title "my-phone"
--no-window-title-bar
--always-on-top
-f # fullscreen

# streaming
-b 8M # bitrate
-m 1920 # resolution limit
--crop 800:600:0:0 # W:H:X:Y
--max-fps 60
--video-buffer=0 # lower latency
--audio-buffer=0 # lower latency
--video-codec=h265
--no-keyboard
--keyboard=uhid # lower latency
--mouse=uhid # lower latency
--show-touches
--stay-awake
--power-off-on-close
--disable-screensave
-S # phone screen off (less work for phone)

# recording
-r recording.mp4 # record
--no-display -r recording.mkv # record without displaying
--no-video -r audio-recording.mp4
--audio-codec=opus
--no-audio

# clipboard
--clipboard-autosync
--no-clipboard-autosync
# drag & drop files/apk into window

# presets
-b 1M --max-fps 60 --stay-awake --video-buffer=0 --no-audio --video-codec=h264 --render-driver=opengl --keyboard=uhid -m 1280 # lowest latency
--no-display --no-audio -r out.mp4 # silent recording
```