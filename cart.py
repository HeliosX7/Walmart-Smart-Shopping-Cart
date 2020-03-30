from gpiozero import LED
from time import sleep
from gpiozero import MotionSensor
from signal import pause
import serial
from picamera.array import PiRGBArray
from picamera import PiCamera
import time
import sys
import cv2
import zbar
import Image
import pandas as  pd
import numpy as np

led=LED(18)
pir=MotionSensor(23)
led.on()
print("Waiting for pir to  settle")
pir.wait_for_no_motion()
print("ready")
led.off()

port="/dev/ttyACM0"
s1=serial.Serial(port,9600)

data=pd.read_csv('itemdata.csv')
print(data)
# Debug mode
DEBUG = False
if len(sys.argv) > 1:
	DEBUG = sys.argv[-1] == 'DEBUG'

# Configuration options
FULLSCREEN = not DEBUG
if not DEBUG:
    RESOLUTION = (1280, 720)
else:
	RESOLUTION = (1280,720)

# Initialise Raspberry Pi camera
camera = PiCamera()
camera.resolution = RESOLUTION
#camera.framerate = 10
#camera.vflip = True
#camera.hflip = True
#camera.color_effects = (128, 128)
# set up stream buffer
rawCapture = PiRGBArray(camera, size=RESOLUTION)
# allow camera to warm up
#time.sleep(0.1)
#print "PiCamera ready"

# Initialise OpenCV window
if FULLSCREEN:
	cv2.namedWindow("#iothack15", cv2.WND_PROP_FULLSCREEN)
	cv2.setWindowProperty("#iothack15", cv2.WND_PROP_FULLSCREEN, cv2.cv.CV_WINDOW_FULLSCREEN)
else:
	cv2.namedWindow("#iothack15")

#print "OpenCV version: %s" % (cv2.__version__)
print "Press q to exit ..."

#weight_init
#s1.flushInput() #flush buffer
#pre_loop=0;
#k=0;
#for n  in range(10):
       # if s1.inWaiting()>0:
               # line = s1.readline()
               # k=k+float(line)

                #print(type(k))
                
#weigh_avg=k/10; 
#print(weigh_avg);


s1.flushInput()
scanner = zbar.ImageScanner()
scanner.parse_config('enable')
codes=[]
i=0
# Capture frames from the camera
cart = []
try:
 while True:
  for frame in camera.capture_continuous(rawCapture, format="bgr", use_video_port=True):
    k=0.0;
    s1.reset_input_buffer()
    # time.sleep(1)
    #s1.flushInput()
    #for m  in range(10):
    # s1.flushInput()
    while not s1.inWaiting()>0:
        continue

    while s1.read() != '*' :
        continue

    line = s1.readline()
   # print(line)
    # k=k+float(line)
   
                #print(type(k))
   
    prev_avg=float(line);
    print(prev_avg);
   
   
   
    i=len(codes)
 # as raw NumPy array
    output = frame.array.copy()
    
    # raw detection code
    gray = cv2.cvtColor(output, cv2.COLOR_BGR2GRAY, dstCn=0)
    pil = Image.fromarray(gray)
    width, height = pil.size
    raw = pil.tobytes()

    # create a reader
    image = zbar.Image(width, height, 'Y800', raw)
    scanner.scan(image)

    # extract results
    for symbol in image:
        # do something useful with results
        print( symbol.data)
	#print(type(symbol.data))
	codes.append(symbol.data)

    j = len(codes)
    if i!=j:
	s1.flushInput()
	time.sleep(4.0)
        s1.reset_input_buffer()
        while not s1.inWaiting()>0:
            continue

        while s1.read() != '*' :
            continue

        line = s1.readline()
        current=float(line)
        
        print(current);
        
	#current="weight  current"
	for bar in data['barcode']:
		if str(bar) == symbol.data:
			name = (data.loc[data['barcode']==bar, 'item'].item())	
			cost = (data.loc[data['barcode']==bar, 'price'].item())
			weight = (data.loc[data['barcode']==bar, 'weight'].item())

		
			differ=current-prev_avg
		#	print(differ)
		#	print(1200*weight)
		#	print(800*weight)
			#if((differ<(1200*weight)) and (differ>(800*weight))):
				
			#	cart.append(name)
			#	print("item added - ", name, cost)
		         #       print(cart)
				#ADDDD TO THE LIST####
			if(differ<10):
			
				name = (data.loc[data['barcode']==bar, 'item'].item())       
				###DELETE THE VALUE
                                cost = (data.loc[data['barcode']==bar, 'price'].item())
				cart.remove(name)
				print("deleted item  - " , name , cost)
				print(list)
			if(differ>1100*weight):
				print("ERROR")
			else:
			 cart.append(name)
                         print("item added - ", name, cost)
                         print(cart)
                                #ADDDD TO THE LIST####


	#time.sleep(2.0)

    # show the frame
   # cv2.imshow("#iothack15", output)

 
   
 # clear stream for next frame
    rawCapture.truncate(0)
    print("--!")
    # Wait for the magic key
    keypress = cv2.waitKey(1) & 0xFF
    if keypress == ord('q'):
    	break
	
except KeyboardInterrupt:
 camera.close()
 cv2.destroyAllWindows()


 tcost=[]
 for bar in data['barcode']:
	n=0
	for code in codes:
		if str(bar) == code :
			n = n+1
	name = (data.loc[data['barcode']==bar, 'item'].item())
	cost = n*(data.loc[data['barcode']==bar, 'price'].item())

	tcost.append(cost)
 total = np.array(tcost)
 totalcost = total.sum()
 print(cart)
 print(totalcost)

 pir.wait_for_motion()
 led.on()
 print("Motion detected")
 time.sleep(3)
 pir.wait_for_motion()
 led.on()
 print("Motion detected")
 time.sleep(3)

