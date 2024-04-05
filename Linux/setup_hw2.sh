#!/usr/bin/env bash

REPO_NAME="$1"

if [ -z "$REPO_NAME" ]; then
    echo "Usage: $0 <repo_ssh_url>"
    exit 1
fi

echo "Cloning repository..."
if ! git clone "git@github.com:NYUAppSec/$REPO_NAME.git"; then
    if ! git clone "$REPO_NAME"; then 
        echo "Error: Failed to clone repository, make sure you have setup SSH keys on your machine and added the public key to your github account"
        exit 1
fi

echo "Installing necessary packages..."
sudo apt install python3-pip
sudo apt install python3-venv

echo "Creating virtual enviroment..."
python3 -m venv appsec_hw2
source ./appsec_hw2/bin/activate
pip3 install -r $REPO_NAME/requirements.txt

python3 manage.py makemigrations LegacySite
python3 manage.py migrate
python3 manage.py shell -c 'import import_dbs'