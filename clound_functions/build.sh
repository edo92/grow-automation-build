import os, subprocess
import shutil
from datetime import datetime

now = str(datetime.now()).split(' ')
each = now[1].split(':')[2]

bin_folder = "bin-{}-{}".format(now[0], each)
dir_path = os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..', bin_folder))


os.system('git clone https://github.com/edo92/cloud-functions {}'.format(bin_folder))
os.system('cd {} && tsc'.format(bin_folder));

shutil.rmtree('./{}/src'.format(bin_folder))
os.system('cd {} && ren dist src'.format(bin_folder))

shutil.move('./{}/src'.format(bin_folder), './{}/functions'.format(bin_folder))

shutil.copy2('./{}/package.json'.format(bin_folder),  './{}/functions'.format(bin_folder))
os.system('cd {} && cd functions && npm install'.format(bin_folder))

os.remove('./{}/package.json'.format(bin_folder))
os.remove('./{}/tsconfig.json'.format(bin_folder))
os.remove('./{}/README.md'.format(bin_folder))
os.remove('./{}/functions/package-lock.json'.format(bin_folder))


firebase_firebaserc = '''{
  "projects": {
    "default": "xxxtest-974ee"
  }
}
'''
firebase_json = '''{
}
'''

# Write compose commands
with open("{}/.firebaserc".format(bin_folder), "w") as file:
    file.write(firebase_firebaserc)

with open("{}/firebase.json".format(bin_folder), "w") as file:
    file.write(firebase_json)
