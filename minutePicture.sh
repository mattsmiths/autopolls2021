#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
PDIR=$(date +"%Y-%m-%d_%H")
mkdir -p /mnt/autopolls/$PDIR

raspistill --nopreview -ss 3000 -t 55000 --timelapse 1000 -o /mnt/autopolls/$PDIR/$DATE%06d.jpg

# Time restriction -now implemented in crontab
#HOURCHK=$(date +"%H")
#if $([ $(($HOURCHK)) -gt 5 ]) && $([ $(($HOURCHK)) -lt 22 ])
#  raspistill --nopreview -ss 3000 -t 55000 --timelapse 1000 -o /mnt/autopolls/$PDIR/$DATE%06d.jpg
#fi

# Saving 1 minute MJPEGs for compressed file size
#raspistill --nopreview -ss 3000 -t 55000 --timelapse 1000 -o /mnt/autopolls/$DATE%06d.jpg
#raspivid -w 4056 -h 3040 -cd MJPEG -o /mnt/autopolls/$DATE.mjpeg --nopreview -t 55000 -fps 1 -ss 3000
