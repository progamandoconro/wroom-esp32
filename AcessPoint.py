try:
  import usocket as socket
except:
  import socket

import network

ssid = 'ScaryBug'
password = '123456789'

ap = network.WLAN(network.AP_IF)
ap.active(True)
ap.config(essid=ssid, password=password)

while ap.active() == False:
  pass

print(ap.ifconfig())

def web_page():
  html = """<html><head><meta name="viewport" content="width=device-width, initial-scale=1"></head>
  <body><h1>Hello, Hackers!</h1></body></html>"""
  return html
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 80))
s.listen(5)

conn, addr = s.accept()
print('Got a connection from %s' % str(addr))
request = conn.recv(1024)
print('Content = %s' % str(request))
response = web_page()
conn.send(response)

from machine import Pin
from time import sleep
import random

led = Pin(2, Pin.OUT)
for i in range (1,10**100):
    sleep(1);led.value(1)
    conn.send(response)
    sleep(1);led.value(0)
    sleep(1);led.value(1)
