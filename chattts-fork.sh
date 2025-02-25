#!/bin/sh

# repo: https://github.com/Samge0/ChatTTS-fork
# repo: https://github.com/2noise/ChatTTS

set -e

envFolder=chatttsForkEnv

alias pythonExec=python3.10

# if not exist, create a new virtual environment
if [ ! -d "$envFolder" ]; then
    echo "Creating virtual environment..."
    python3.10 -m venv $envFolder
fi


# if $VIRTUAL_ENV  has suffix  $envFolder
if [[ "$VIRTUAL_ENV" == *"$envFolder" ]]; then
    # if chattts is not installed, install it
    if ! python -m pip show chattts-fork > /dev/null; then
        echo "Installing chattts..."
        # torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 
        python -m pip install numpy==1.24 torch==2.1.2
        python -m pip install -U chattts-fork

        echo "now try it:"
        echo '$' "chattts '你好,你好' --seed=1448 -o 123.mp3"
    fi
else
    # env is not activated, activate it
    echo "run following command to activate the environment:"
    echo '$' source $envFolder/bin/activate
    echo "then run this script again."
fi






