# autopolls

Install libbrary prerequisites
sudo apt-get upgrade




Install wittypi\
wget http://wwww.uugear.com/repo/WittyPi3/install.sh\
sudo sh install.sh\
reboot\
cd /home/pi/wittypi/\
sudo nano schedule.wpi\

Install I2C software\

Modify crontab\

Mount external\ 
sudo fdisk -l\
sudo nano /etc/fstab\
UUID=605A-99E3 /mnt/autopolls exfat defaults,auto,users,rw,nofail,umask=000 0 0\
sudo mkdir /mnt/autopolls/\
sudo mount /dev/sda1 /mnt/autopolls\

