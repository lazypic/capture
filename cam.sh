FILE="$(date +%Y%m%dT%H%M%S)"
ffmpeg -f avfoundation -i "1:0" ~/desktop_$FILE.mkv & ffmpeg -f avfoundation -i "0:0" -c:v prores ~/face_$FILE.mov &
