FILE="desktop_$(date +%Y%m%dT%H%M%S).mkv"
ffmpeg -f avfoundation -i "1:0" ~/$FILE
