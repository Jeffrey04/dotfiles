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
        "libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev",
        shell=True,
    )

elif platform.system() == "Darwin":
    subprocess.call(
        "brew install --force openssl readline sqlite3 xz zlib tcl-tk", shell=True
    )

subprocess.call("curl https://pyenv.run | bash", shell=True)

subprocess.call(["bash", "-c", "$HOME/.pyenv/bin/pyenv global system system"])
subprocess.call(
    [
        "bash",
        "-c",
        f"$HOME/.pyenv/bin/pyenv install -f {config["configuration"]["install_version"]}",
    ]
)

if platform.system() == "Linux":
    subprocess.call("sudo apt install -y pipx", shell=True)

elif platform.system() == "Darwin":
    subprocess.call("brew install --force pipx", shell=True)

subprocess.call(["pipx", "install", "--force", "poetry"])


if platform.system() == "Linux":
    subprocess.call("sudo apt install -y python-is-python3", shell=True)

elif platform.system() == "Darwin":
    # mimic python-is-python3 with homebrew
    subprocess.call("ln -s /usr/local/bin/python3 /usr/local/bin/python", shell=True)
