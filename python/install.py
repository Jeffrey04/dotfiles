#!/usr/bin/env python
import json
import platform
import subprocess

with open("config.json") as f:
    config = json.load(f)

if platform.system() == "Linux":
    subprocess.call(
        "sudo apt update; sudo apt install -y build-essential libssl-dev zlib1g-dev "
        "libbz2-dev libreadline-dev libsqlite3-dev curl "
        "libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev"
    )

elif platform.system() == "Darwin":
    subprocess.call("brew install --force openssl readline sqlite3 xz zlib tcl-tk")

subprocess.call("curl https://pyenv.run | bash", shell=True)

subprocess.call(["pyenv", "global", "system", "system"])
subprocess.call(["pyenv", "install", "-f", config["configuration"]["install_version"]])

if platform.system() == "Linux":
    subprocess.call(["sudo", "apt", "install", "-y", "pipx"])

elif platform.system() == "Darwin":
    subprocess.call(["brew", "install", "--force", "pipx"])

subprocess.call(["pipx", "install", "--force", "poetry"])
