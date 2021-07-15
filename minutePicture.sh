#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
HOURCHK=$(date +"%H")

if $([ $(($HOURCHECK)) -gt 5 ]) && $([ $(($HOURCHECK)) -lt 22 ])
  raspistill --nopreview -ss 3000 -t 55000 --timelapse 1000 -o /mnt/autopolls/$DATE%06d.jpg
fi

#raspistill --nopreview -ss 3000 -t 55000 --timelapse 1000 -o /mnt/autopolls/$DATE%06d.jpg
#raspivid -w 4056 -h 3040 -cd MJPEG -o /mnt/autopolls/$DATE.mjpeg --nopreview -t 55000 -fps 1 -ss 3000
