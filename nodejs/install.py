import json
import subprocess

with open("config.json") as f:
    config = json.load(f)

subprocess.call("cargo install fnm", shell=True)
subprocess.call(f"fnm install {config['configuration']['install_version']}", shell=True)