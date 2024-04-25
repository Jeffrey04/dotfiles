#!/usr/bin/env python
import json
import platform
import subprocess

with open("config.json") as f:
    config = json.load(f)

subprocess.call("curl https://pyenv.run | bash", shell=True)

# FIXME install python2 proxy and pipx
# subprocess.call(["sudo", "apt", "install", "-y", "python-is-python3", "pipx"])

subprocess.call(["pyenv", "global", "system", "system"])
subprocess.call(["pyenv", "install", "-f", config["configuration"]["install_version"]])

if platform.system() == "Linux":
    subprocess.call(["sudo", "apt", "install", "-y", "pipx"])

elif platform.system() == "macOS":
    subprocess.call(["brew", "install", "--force", "pipx"])

subprocess.call(["pipx", "install", "--force", "poetry"])
