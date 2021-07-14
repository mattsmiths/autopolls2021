Autopolls
-----


# Install system requirements
Update system
```bash
sudo apt update
sudo apt full-upgrade
```
Install python libraries
```bash
sudo pip3 install adafruit-circuitpython-ms8607
sudo apt install python3-numpy python3-opencv
```

# Clone this repository

Prepare for and clone this repository
```bash
. ~/.bashrc
git clone https://github.com/mattsmiths/autopolls.git
```

# Install wittyPi mini software

Make sure the witty pi mini is attached and receiving power into the micro-usb port

```bash
cd ~/
wget http://wwww.uugear.com/repo/WittyPi3/install.sh
sudo sh install.sh
reboot
```

Move the autopolls schedule to the witty pi directory

```bash
cd ~/
sudo mv /home/pi/autopolls/schedule.wpi /home/pi/wittypi/schedule.wpi
~./runScript.sh
```

# Setup external storage mount

Assumes you're using an external storage drive that shows up as /dev/sda1. \
Check via: 
```bash
sudo fdisk -l
```
Create mount directory
```bash
sudo mkdir /mnt/autopolls
sudo mount /dev/sda1 /mnt/autopolls
```
Automatically mount this specific external drive to the mount directory off boot\
Check UUID of drive; ex: 605A-99E3
```bash
sudo fdisk -l
sudo blkid
```
Run the following command after replacing "XXXX-XXXX" with found UUID
```bash
echo "UUID=XXX-XXXX /mnt/autopolls exfat defaults,auto,users,rw,nofail,umask=000 0 0" | sudo tee -a /etc/fstab
```
# Add sensor and camera scripts to cronjob

Open cronjobs
```bash
crontab -e
```

Add the following two lines to the end of crontab -e file

```bash
* * * * * ( /home/pi/autopolls/minutePicture.sh)
* * * * * ( sudo python3 /home/pi/autopolls/sensorCall.py)
```

# Add realtime clock to Raspberry pi

In terminal, confirm that clock is at position 68 in I2C
```bash
sudo i2cdetect -y 1
```

Add the following lines to the end of boot config.txt
```bash
sudo nano /boot/config.txt
```
Add the following line within that file and save
```bash
dtoverlay=i2c-rtc,pcf8523
```

Reboot
```bash
sudo reboot
```
Run the following commands in terminal
```bash
sudo apt-get -y remove fake-hwclock
sudo update-rc.d -f fake-hwclock remove
sudo systemctl disable fake-hwclock
```

Start the original hardware clock script
```bash
sudo nano /lib/udev/hwclock-set
```
Comment out these lines
```bash
#if[-e /run/systemd/system];then
#exit 0
#fi
#/sbin/hwclock --rtc=$dev --systz --badyear
#/sbin/hwclock --rtc=$dev --systz
```

Sync time from Pi to RTC *Make sure batter is in RTC*, and you're connected to the internet
```bash
sudo hwclock -r
sudo hwclock -w
sudo hwclock -r
```


