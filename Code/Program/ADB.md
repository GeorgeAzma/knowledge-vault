Allows you to send signals through USB to android phone
``` bash
# phone link: settings > developer options > wireless debugging 
adb pair <phone-ip>:<pair-port> # enter 6-digit code from 'wireless debugging'
adb connect <phone-ip>:<connect-port> # connect port from 'wireless debugging'

adb devices

adb shell ps # processes
adb shell kill <pid> # kill

# files / data / packages
adb pull /sdcard/screenshot.webp . # pull file
adb install app.apk # install apk
adb uninstall com.example.app # uninstall
adb shell pm clear com.example.app # clear data
adb shell screenrecord /sdcard/video.mp4 # record
adb shell pm list packages # apps

# actions
adb shell am broadcast -a android.intent.action.FLASHLIGHT_TOGGLE # flashlight
adb reboot # reboot
adb shell settings put system screen_brightness 128 # set brightness
adb shell settings put global airplane_mode_on 1 # airplane on
adb shell settings put system accelerometer_rotation 1 # rotate on
adb shell svc data enable # data on
adb shell screencap /sdcard/screenshot.webp # screenshot

# launch
adb shell monkey -p com.example.app -c android.intent.category.LAUNCHER 1 # launch app
adb shell am start -a android.intent.action.MAIN -n com.android.settings/.wifi.WifiSettings # wifi
adb shell am startservice -n com.example.app/.MyService # service
adb shell am start -a android.intent.action.VIEW -d "https://example.com" # website
adb shell am start -a android.media.action.IMAGE_CAPTURE # open camera
adb shell am start -a android.intent.action.VIEW -d "file:///sdcard/Music/song.mp3" -t "audio/*" # play song
adb shell am start -a android.intent.action.VIEW -d "geo:37.7749,-122.4194" # maps
adb shell am start -a android.intent.action.ATTACH_DATA -c "image/*" -d "file:///sdcard/Pictures/wallpaper.webp" # wallpaper

# info
adb shell cat /proc/cpuinfo # cpu
adb shell dumpsys battery # battery
adb shell dumpsys sensorservice # sensors
adb shell dumpsys network # network
adb shell dumpsys activity services # services
adb shell dumpsys activity activities # activities
adb shell dumpsys location # location

# sms / call
adb shell am broadcast -a android.provider.Telephony.SMS_RECEIVED --es pdus "0001020304050607" # fake sms
adb shell am start -a android.intent.action.SENDTO -d "sms:1234567890" --es sms_body "Hello" # sms  
adb shell am start -a android.intent.action.CALL -d "tel:1234567890" # call
```
