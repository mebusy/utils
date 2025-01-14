#!/bin/sh

# repo: https://github.com/ggerganov/whisper.cpp

set -e

# if folder whisper.cpp does not exist, clone it
if [ ! -d "whisper.cpp" ]; then
    echo "Cloning whisper.cpp..."
    git clone https://github.com/ggerganov/whisper.cpp.git
else 
    echo "whisper.cpp already exists."
fi

(cd whisper.cpp && make -j && make -j large-v2)

echo 'done!'

echo 'to use it'
echo '1. extract the audio file from video into a mono wav(16k) file for whisper to recognize'
echo '  $ ffmpeg -i test.mp4 -ac 1 -ar 16000 test.wav'
echo '2. run whisper'
echo '  $ cd whisper.cpp'
echo '  $ ./build/bin/whisper-cli -l zh --prompt "以下是普通话的句子"  -m models/ggml-large-v2.bin -osrt -f test.wav'
echo ''
echo 'use Jubler https://www.jubler.org/download.html to verify the srt.'



