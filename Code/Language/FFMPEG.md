``` sh
### Video ###
-ss 30 -ss 00:01:30 # start pos
-t 30 -t 00:01:30 # duration
-b:v 2M # bit-rate
-c:v libvpx-vp9 # change codec
-vframes 1 out.webp # extract 1 frame (at start pos)
-i in.mp4 out-%%4d.webp # to frames
-framerate 30 -i img-%04d.webp -c:v libx264 -pix_fmt yuv420p out.mp4 # from frames
-vf "scale=1920x1080" # resize (1920:1080 also works)
-vf "unsharp=5:5:1.0:5:5:1.0" # upscale/sharpen
-vf "cmd1,cmd2" # multiple commands
-filter_complex "[0:v]reverse[f];[0:a]areverse[a]" -map "[f]" -map "[a]"
-filter:v "setpts=0.5*PTS" # speed-up (2.0*PTS to slowdown)
-filter:v "fps=60"
-vf "fps=10,scale=320:-1:flags=lanczos" out.gif # to gif
-vf "hue=s=0" # grayscale
-c copy # avoid re-encoding when not needed (e.g. trim)
-an # remove audio
-map a -q:a 0 # extract audio

### Image ###
-filter "crop=iw-14:ih-54:7:32" # crop (top left is origin)

### Audio ###
-b:a 192k # bit-rate
-ar 44100 # sample rate
-ac 1 # mono
-af loudnorm # normalize
-af "volume=2dB"
-q:a # quality, 0 (best) to 9 (worst), (3 decent)
-af areverse
 
### General ###
-y # overwrite files
```
### FFPlay
``` bash
 ffplay audio.wav -nodisp -autoexit
```
