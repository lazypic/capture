FILE="$(date +%Y%m%dT%H%M%S).mkv"
ffmpeg -f avfoundation -i "1:0" ~/desktop_$FILE & ffmpeg -f avfoundation -i "0:0" ~/face_$FILE &
