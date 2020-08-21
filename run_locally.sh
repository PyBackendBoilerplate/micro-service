#!/bin/bash

VENV=".venv"
if [ ! -d "$VENV" ]; then
    echo "Installing virtual environment in $VENV"
    python3 -m venv $VENV

    ./install_requirements.sh
fi

source .venv/bin/activate

python src/main.py

deactivate

py3clean .