import os, subprocess
import shutil

# Clone repo & rename
source_code = 'https://github.com/edo92/Dashboard-client.git'
new_dir = ' frontend'

os.system('cd bin && git clone ' + source_code + new_dir)

os.system('cd bin && cd frontend && python build.sh')