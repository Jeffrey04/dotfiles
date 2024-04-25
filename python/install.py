#!/usr/bin/env python
import json
import subprocess

with open("config.json") as f:
    config = json.load(f)

# FIXME install python2 proxy and pipx
# subprocess.call(["sudo", "apt", "install", "-y", "python-is-python3", "pipx"])

# FIXME install pyenv
subprocess.call(["pyenv", "global", "system", "system"])
subprocess.call(["pyenv", "install", "-f", config["configuration"]["install_version"]])

subprocess.call(["sudo", "apt", "install", "-y", "pipx"])
subprocess.call(["pipx", "install", "--force", "poetry"])
