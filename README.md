# autopolls

Installation notes
-----


# Install system requirements

```bash
sudo apt update
sudo apt full-upgrade
sudo pip3 install adafruit-circuitpython-ms8607
sudo apt install python3-numpy python3-opencv python3-requests python3-flask python3-systemd nginx-full vsftpd virtualenvwrapper apache2-utils python3-gst-1.0 
```

# Clone this repository

Prepare for and clone this repository
```bash
. ~/.bashrc
mkdir -p ~/autopolls
cd ~/autopolls
git clone https://github.com/mattsmiths/autopolls.git
```

# Install wittyPi mini software

Make sure the witty pi mini is attached and receiving power into the micro-usb port

```bash
wget http://wwww.uugear.com/repo/WittyPi3/install.sh\
sudo sh install.sh\
reboot\
```

Move the autopolls schedule to the witty pi directory

```bash
sudo mv /home/pi/autopolls/schedule.wpi /home/pi/wittypi/schedule.wpi
~./runScript.sh
```

# Setup external storage mount

Assumes you're using an external storage drive that shows up as /dev/sda1.
To format the drive as ntfs (to allow for >2TB volumes) in fdisk you will need to:

```bash
echo "UUID=605A-99E3 /mnt/autopolls exfat defaults,auto,users,rw,nofail,umask=000 0 0" | sudo tee -a /etc/fstab
sudo mkdir /mnt/autopolls
sudo mount /dev/sda1 /mnt/autopolls
```

# Add sensor and camera scripts to cronjob

Open cronjobs
```bash
crontab -e
```

Add the following two lines to the end of crontab -e file

```bash
* * * * * ( /home/pi/autopolls/minutePicture.sh)
* * * * * ( sudo python3 /home/pi/autopolls/newSensor.py)
```


