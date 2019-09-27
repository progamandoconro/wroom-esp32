sudo apt-get install -y build-essential tk-dev libncurses5-dev libncursesw5-dev \
libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev \
libexpat1-dev liblzma-dev zlib1g-dev libffi-dev

wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz

sudo tar zxf Python-3.7.0.tgz
cd Python-3.7.0
sudo ./configure
sudo make -j 4
sudo make altinstall


sudo apt install python3-pip
sudo pip3 install esptool

dmesg | grep ttyUSB

esptool.py --port /dev/ttyUSB0 erase_flash

wget https://micropython.org/resources/firmware/esp32-20190907-v1.11-291-gc69f58e6b.bin

esptool.py --port /dev/ttyUSB0 write_flash 0x1000 <path to firmware file>

sudo pip3 install rshell

rshell --buffer-size=30 -p /dev/ttyUSB0 
repl

######## We are in MicroPython ################

import network

station = network.WLAN(network.STA_IF)
station.active(True)
station.connect("YourNetworkName", "YourNetworkPassword")
station.isconnected()
station.ifconfig()

ap= network.WLAN(network.AP_IF)
ap.active(True)
ap.config(essid='ScaryBug')

##### random blinking #######

from machine import Pin
from time import sleep
import random

led = Pin(2, Pin.OUT)
for i in range (1,10**100):
      r=random.randint(0,1)
      sleep(0.1);led.value(r)
      
## Raspberrypi zero GPIO LED blink

import gpiozero as io
from time import sleep
import random 

led=io.LED(17)

for i in range(1,1000000):
      r=random.randint(0,9)*0.1
      led.on()
      sleep(0.1*r)
      led.off()
      sleep(0.2*r)
      led.off()
      sleep(0.3*r)
      led.on()
      

## para obtener, transferir u otro tipo de interaccion. usar ampy (apt install ampy)

ampy --port /dev/ttyUSB2 ls




