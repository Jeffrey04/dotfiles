#!/usr/bin/env python
import json
import os
import platform
import subprocess

with open("config.json") as f:
    config = json.load(f)


if platform.system() == "Linux":
    subprocess.call("sudo apt fish", shell=True)

elif platform.system() == "Darwin":
    subprocess.call("brew install --force fish", shell=True)

subprocess.call(
    "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher",
    shell=True,
    executable="/usr/bin/fish",
)

fish_path = "/usr/bin/fish"
if platform.system() == "Darwin":
    fish_path = "/usr/local/bin/fish"

for plugin in config["config"]["plugins"]:
    subprocess.call(
        f"fisher install {plugin}",
        shell=True,
        executable=fish_path,
    )

subprocess.call(
    ["stow", "-R", f"--target={os.environ['HOME']}", "--verbose=3", "content"]
)
