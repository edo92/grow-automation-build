import os, subprocess
import shutil

# Clone repo & rename
source_code = 'https://github.com/edo92/Server.git'
workdir = 'bin'
new_dir = ' backend'

os.system('cd bin && git clone ' + source_code + new_dir)

# Compile typescript & install depends & complie
os.system('cd bin && cd backend && python build.sh')