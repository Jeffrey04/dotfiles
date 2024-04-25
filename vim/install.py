#!/usr/bin/env python
import json
import os
import platform
import subprocess

with open("config.json") as f:
    config = json.load(f)

os.makedirs(f"{os.environ['HOME']}/Applications", exist_ok=True)

if platform.system() == "Linux":
    subprocess.call(
        [
            "curl",
            "-L",
            "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage",
            "-o",
            f"{os.environ['HOME']}/Applications/nvim.appimage",
        ]
    )
    subprocess.call(
        f"chmod +x {os.environ['HOME']}/Applications/nvim.appimage", shell=True
    )

elif platform.system() == "Darwin":
    subprocess.call("brew install --force neovim", shell=True)

os.makedirs(f"{os.environ['HOME']}/.config/nvim", exist_ok=True)
os.makedirs(f"{os.environ['HOME']}/.local/share/nvim/site/pack", exist_ok=True)
subprocess.call(
    ["stow", "-R", f"--target={os.environ['HOME']}", "--verbose=3", "content"]
)


cwd = os.getcwd()

os.chdir(f"{os.environ['HOME']}/.config/nvim")
# FIXME get python version from python's config.json
subprocess.call("pyenv local 3.12.3 3.12.3", shell=True)
subprocess.call("poetry init --name=nvim --python=^3.12 --no-interaction", shell=True)
subprocess.call("poetry config --local virtualenvs.in-project true", shell=True)
subprocess.call("poetry add pynvim", shell=True)
subprocess.call("echo v20.10.0 > .nvimrc", shell=True)
subprocess.call("nvm use", shell=True)
subprocess.call("corepack enable", shell=True)
subprocess.call("yarn install", shell=True)
subprocess.call("yarn add neovim", shell=True)
subprocess.call("nvm exec yarn install", shell=True)
subprocess.call("rbenv local 3.2.2", shell=True)
subprocess.call("bundle init", shell=True)
subprocess.call("bundle add neovim", shell=True)
subprocess.call(
    "bundle install && bundle binstubs --force --standalone neovim", shell=True
)

os.chdir(f"{os.environ['HOME']}/.local/share/nvim/site/pack")

for plugin in config["config"]["plugins"]:
    plugin_name = plugin.split("/")[-1]
    plugin_path = f"{plugin_name}/start"
    os.makedirs(plugin_path)
    subprocess.call(["git", "clone", plugin, f"{plugin_path}/{plugin_name}"])

os.chdir(cwd)
