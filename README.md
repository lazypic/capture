# desktopcap
macOS에서 ffmpeg를 이용해서 화면을 캡쳐하는 방법을 설명합니다.
ffmpeg 명령어에서 avfoundation을 사용하면 됩니다.

#### ffmpeg 설치하기
- brew를 통해서 ffmpeg를 설치합니다.
```bash
$ brew install ffmpeg
```

#### input Device 검색하기
먼저 해당 컴퓨터에 캡쳐에 필요한 input device 목록을 확인하기 위해서는 아래와 같은 명령어를 입력해주세요.
- macOS input device 장비목록을 보기
```bash
$ ffmpeg -f avfoundation -list_devices true -i ""
```

- 맨 아랫줄에 AVFoundation input device 항목이 출력됩니다.

```
ffmpeg version 4.0.1 Copyright (c) 2000-2018 the FFmpeg developers
  built with Apple LLVM version 9.0.0 (clang-900.0.39.2)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/4.0.1 --enable-shared --enable-pthreads --enable-version3 --enable-hardcoded-tables --enable-avresample --cc=clang --host-cflags= --host-ldflags= --enable-gpl --enable-libmp3lame --enable-libx264 --enable-libxvid --enable-opencl --enable-videotoolbox --disable-lzma
  libavutil      56. 14.100 / 56. 14.100
  libavcodec     58. 18.100 / 58. 18.100
  libavformat    58. 12.100 / 58. 12.100
  libavdevice    58.  3.100 / 58.  3.100
  libavfilter     7. 16.100 /  7. 16.100
  libavresample   4.  0.  0 /  4.  0.  0
  libswscale      5.  1.100 /  5.  1.100
  libswresample   3.  1.100 /  3.  1.100
  libpostproc    55.  1.100 / 55.  1.100
[AVFoundation input device @ 0x7fa6d940e940] AVFoundation video devices:
[AVFoundation input device @ 0x7fa6d940e940] [0] FaceTime HD 카메라(내장형)
[AVFoundation input device @ 0x7fa6d940e940] [1] Capture screen 0
[AVFoundation input device @ 0x7fa6d940e940] AVFoundation audio devices:
[AVFoundation input device @ 0x7fa6d940e940] [0] Built-in Microphone
```

- 저는 내장카메라 0번, 화면 1번, 내장마이크 0번 총 3개의 장비를 사용할 수 있네요.

#### 레코딩하기
- 아래 명령을 이용해서 위 device를 소스로 레코딩하는 명령어는 아래와 같습니다.
```bash
$ ffmpeg -f avfoundation -i "<screen device index>:<audio device index>" output.mkv
```

- 작업화면과 목소리를 담고 싶다면 아래 명령어를 터미널에서 입력해주세요.
```bash
$ ffmpeg -f avfoundation -i "1:0" output.mkv
```

- 내장카메라 + 목소리를 담고 싶다면 아래 명령어를 터미널에서 입력해주세요.
```bash
$ ffmpeg -f avfoundation -i "0:0" output.mkv
```
