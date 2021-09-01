import board
import busio
import os
import datetime
from adafruit_ms8607 import MS8607
import adafruit_bh1750


if os.path.isfile('/home/pi/sensorLogger.txt') == False:
  o1 = open('/home/pi/sensorLogger.txt','a')
  o1.close()
  
o1 = open('/home/pi/sensorLogger.txt','a')
i2c = busio.I2C(board.SCL,board.SDA)
sensor = MS8607(i2c)

tC = sensor.temperature
tP = sensor.pressure
tH = sensor.relative_humidity

# import light sensor and reset i2c variable
i2c = board.I2C()
sensor = adafruit_bh1750.BH1750(i2c)
tL = sensor.lux

time1 = datetime.datetime.now()
time1 = time1.strftime('%m%d%H%M%S')
tempString = time1+' '+str(tC)+' '+str(tH)+' '+str(tP)+' '+str(tL)

o1.write(tempString+'\n')
o1.close()

