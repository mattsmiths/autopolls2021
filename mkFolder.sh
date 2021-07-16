#!/bin/bash
# Making a new folder, use crontab to run every hour
PDIR=$(date +"%Y-%m-%d_%H")
mkdir -p /mnt/autopolls/$PDIR
