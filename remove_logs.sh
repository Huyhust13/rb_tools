#!/bin/bash

folder1="$HOME/log_agv"
folder2="$HOME/.ros/log"

sudo find $folder1 -type f -mtime +2 -exec rm {} \;
sudo find $folder2 -type f -mtime +2 -exec rm {} \;
sudo find $folder2 -type d -mtime +2 -exec rm -rf {} +