FILE="face_$(date +%Y%m%dT%H%M%S).mkv"
ffmpeg -f avfoundation -i "0:0" ~/$FILE
