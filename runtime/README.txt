In order to run the technical stuff in OVERTIME, do the following:

npm
check to see if you have it from the command line via...
npm --help
if not, https://npmjs.org/, download and install

node.js
http://nodejs.org/, download and install

socket.io
from the command line...
npm install socket.io

osc-web
from the command line...
git clone git://github.com/automata/osc-web.git
cd osc-web
npm install

scsynth
Download supercollider (http://supercollider.sourceforge.net/)
open up allsynths.scd and run it
then, from the command line...
/Applications/SuperCollider/SuperCollider.app/Contents/Resources/scsynth -u 57110 -a 128 -b 1026 -R 0

scbridge.js
from the command line, in this directory:
node scbridge.js

overtime.html
This is the main document. Open it in chrome, then press the space bar. 
From this point, you'll be able to follow all the cues in the script, which
only ever involve pressing a key on the computer at the right time.
