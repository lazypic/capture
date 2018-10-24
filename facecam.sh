FILE="face_$(date +%Y%m%dT%H%M%S).mov"
ffmpeg -f avfoundation -i "0:0" -c:v prores ~/$FILE
