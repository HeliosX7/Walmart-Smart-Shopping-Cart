[![HitCount](http://hits.dwyl.io/heliosx7/Walmart-Smart-Shopping-Cart.svg)](http://hits.dwyl.io/heliosx7/Walmart-Smart-Shopping-Cart)

# Smart Shopping Cart | HackFest 19 | Walmart 🛒

---

<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/intro.jpg" width="750">


`Team Name : HORIZON`    

---

## 🔹 Problem Overview

In the present scenario, it has been observed that after shopping in malls or any such place,  customers waste a lot of time at the counter in the queue waiting for there turn of bill processing. We aim at designing the best substitute for the counter that could substitute and drastically reduce the time spent at the billing counters.

---

## 🔹 Solution Overview

Our approach involves combining IOT and Android to offer a seamless shopping experience :


* Each Smart Cart has an in-built Raspberry Pi and Camera to detect the barcode associated with a product.

* PIR and Weight sensors are also attached to the Cart to facilitate an anti-thievery mechanism.

* Firebase Realtime database facilitates the storage and realtime syncing of the user associated data across the devices.

* While, an Android app is also provided for payment and self-checkout.

---

## 🔹 Workflow & Components

<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/workflow.jpg" height="600">

***

<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/components.JPG" width="450">

***

`YES / NO Sections in Cart` :
Our shopping cart consist of user friendly cart with two sections – namely YES section and a NO section. This feature has been incorporated so as to 
make the life of customers easier. Items which are confirmed to be bought are placed in YES section while the items which are not confirmed to be bought are placed in NO section. 

***

## 🔹 Package Requirements

**Python**
* requests
* gpiozero
* serial
* picamera
* opencv
* zbar
* pandas

**Flutter**
* firebase_database
* qr_flutter

***

## 🔹 Demo

<p>
<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/splash.jpg" width="200" height="400">
<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/cart.jpg" width="200" height="400">
<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/items.jpg" width="200" height="400">
</p>
<p>
<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/payment.jpg" width="200" height="400">
<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/qr1.jpg" width="200" height="400">
<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/qr2.jpg" width="200" height="400">
</p>
<br>
<p>
<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/firebase_console.JPG" height="300">
</p>

---

## 🔹 Estimated Cost

| Item                         | Price (₹)     | 
|:----------------------------:|:-------------:| 
| Raspberry pi                 | 2000          | 
| Raspberry pi camera (5 mp)   | 700           |  
| Load sensor and load cell    | 600           |  
| PIR SENSOR                   | 300           | 
| ATMEGA 328p MICROCONTROLLER  | 100           |  
| **`Total`**                  | **`3700`**    |  

> “BUT THE COST CAN BE REDUCED BY THREE FOLDS IF  WE DESIGN THE MICRO-CONTROLLER WITH SPECIFIC FEATURES NEEDED FOR DESIGNING THE SMART CART”


---

## 🔹 Snippets

<img src="https://github.com/HeliosX7/Walmart-Smart-Shopping-Cart/blob/master/images/hackfest_snippet.jpg" width="750">

---

## 🔹 Conclusion

This smart cart will help the customers drastically reduce their waiting time in the queue through it’s self checkout facility. It is also a cost-effective solution to this problem. 

We have focused on providing a seamless shopping experience using a interactive Android UI and adding a ‘NO’ section for doubtful products. Anti-Thievery was also taken into account and a few measures to prevent this were also deployed.
