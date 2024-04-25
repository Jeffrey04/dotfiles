import json
import subprocess

with open("config.json") as f:
    config = json.load(f)
    from pprint import pprint

    pprint(config)

subprocess.call(
    f"curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v{config['configuration']['nvm_version']}/install.sh | bash",
    shell=True,
)
proc = subprocess.Popen(
    [
        "/usr/bin/bash",
        "-i",
        "-c",
        f"nvm install {config['configuration']['install_version']}",
    ],
)
proc.communicate()
proc.wait()
subprocess.call("pipx install --force nvshim", shell=True)