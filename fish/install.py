#!/usr/bin/env python
import json
import os
import subprocess

with open("config.json") as f:
    config = json.load(f)

subprocess.call(
    "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher",
    shell=True,
    executable="/usr/bin/fish",
)

for plugin in config["config"]["plugins"]:
    subprocess.call(
        f"fisher install {plugin}",
        shell=True,
        executable="/usr/bin/fish",
    )

subprocess.call(
    ["stow", "-R", f"--target={os.environ['HOME']}", "--verbose=3", "content"]
)
