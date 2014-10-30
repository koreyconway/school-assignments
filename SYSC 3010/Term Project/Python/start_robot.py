#!/usr/bin/python
import RPi.GPIO as GPIO
import avenger.robot.robot as robot

def run():
    while True:
        robot.receiveXml.getXml()
        robot.parseXml.parse("avengerState.xml")

if __name__ == "__main__":
    try:
        run()
    except KeyboardInterrupt:
        GPIO.cleanup()
