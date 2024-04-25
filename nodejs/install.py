import json
import subprocess

with open("config.json") as f:
    config = json.load(f)

subprocess.call(
    "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash",
    shell=True,
)
subprocess.call("pipx install nvshim")