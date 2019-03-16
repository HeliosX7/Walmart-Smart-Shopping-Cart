#Anti theft system code using PIR sensor detect the human motion
from gpiozero import LED
from time import sleep
from gpiozero import MotionSensor
from signal import pause
led=LED(18)
pir=MotionSensor(23)

print("Waiting for pir to  settle")
pir.wait_for_no_motion()
time.sleep(2)
while True:
        led.off()
        print("Ready")
        pir.wait_for_motion()
        led.on()
        print("Motion detected")
        time.sleep(3)
