import os, subprocess

os.mkdir('bin')
os.system('python build.server.sh')
os.system('python build.client.sh')
