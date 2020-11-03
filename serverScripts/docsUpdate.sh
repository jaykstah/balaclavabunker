#!/bin/bash
web=/var/www/html
home=/home/jaykstah

cd /home/jaykstah/git/balaclavabunker/ && git init && git pull
sudo rm -f $web/docs/balaclavabunker.html.old
sudo mv $web/docs/balaclavabunker.html $web/docs/balaclavabunker.html.old
sudo cp $home/git/balaclavabunker/docs/balaclavabunker.html $web/docs/balaclavabunker.html
