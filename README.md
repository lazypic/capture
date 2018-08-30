# desktopcap
macOS에서 ffmpeg를 이용해서 작업화면 또는 카메라 캡쳐하는 방법을 설명합니다.
ffmpeg 명령어에서 avfoundation 기능을 사용하는 예제입니다.

#### ffmpeg 설치하기
- 이 작업을 위해서는 먼저 ffmpeg가 설치되어 있어야 합니다.
- brew를 통해서 ffmpeg를 설치합니다.
```bash
$ brew install ffmpeg
```

#### input Device 검색하기
- 해당 컴퓨터에 캡쳐에 필요한 input device 목록을 확인하기 위해서는 터미널에 아래 명령어를 입력해주세요.
```bash
$ ffmpeg -f avfoundation -list_devices true -i ""
```

- 명령어를 터미널에 잘 입력했다면, 맨 아랫줄에 AVFoundation input device 항목이 출력됩니다.

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

- 저는 내장카메라 0번, 화면 1번, 내장마이크 0번 총 3개의 장비를 사용할 수 있다고 나옵니다.

#### 화면 레코딩하기
- 위 device를 소스로해서 화면 또는 카메라를 레코딩하는 터미널 명령어는 아래와 같습니다.
```bash
$ ffmpeg -f avfoundation -i "<screen device index>:<audio device index>" output.mkv
```

- 작업화면 + 목소리를 담고 싶다면 아래 명령어를 터미널에서 입력해주세요.
```bash
$ ffmpeg -f avfoundation -i "1:0" output.mkv
```

- 내장카메라 + 목소리를 담고 싶다면 아래 명령어를 터미널에서 입력해주세요.
```bash
$ ffmpeg -f avfoundation -i "0:0" output.mkv
```

이상 ffmpeg를 이용한 화면캡쳐, 카메라 캡쳐 방법을 알아보았습니다.
