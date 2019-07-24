#!/bin/bash
git clone https://github.com/Artemmkin/reddit.git /home/appuser/reddit
cd /home/appuser/reddit && bundle install
puma -d
