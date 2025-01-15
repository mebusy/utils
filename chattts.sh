#!/bin/sh
# repo: https://github.com/2noise/ChatTTS

set -e

envFolder=chatttsEnv

alias pythonExec=python3.11

# if not exist, create a new virtual environment
if [ ! -d "$envFolder" ]; then
    echo "Creating virtual environment..."
    pythonExec -m venv $envFolder

    # $envFolder/repo not exist, clone the repo
    if [ ! -d "$envFolder/repo" ]; then
        echo "Cloning the repo..."
        git clone https://github.com/2noise/ChatTTS $envFolder/repo
    fi
fi

# if $VIRTUAL_ENV  has suffix  $envFolder
if [[ "$VIRTUAL_ENV" == *"$envFolder" ]]; then
    if ! python -m pip show ChatTTS > /dev/null; then
        (cd $envFolder/repo && python -m pip install --upgrade -r requirements.txt)
        (cd $envFolder/repo && python -m pip install ChatTTS)
    fi


    echo "now try it:"
    echo '$' cd $envFolder/repo
    # echo '$' "python examples/cmd/run.py  '你好,你好'"
    echo '$' "python runChattts.py  '你好,你好'"
else
    # env is not activated, activate it
    echo "run following command to activate the environment:"
    echo '$' source $envFolder/bin/activate
    echo "then run this script again."
fi






