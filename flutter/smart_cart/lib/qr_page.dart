import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:random_string/random_string.dart';

class QRGenerator extends StatefulWidget {
  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  String qrData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 100,right: 100),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            RaisedButton(
              elevation: 0.0,
              color: Colors.transparent,
              onPressed: () {
                setState(() {
                  qrData = randomAlphaNumeric(10);
                });
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue[900], Colors.lightBlue[900]]),
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF6078ea).withOpacity(.3),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 8.0)
                    ]),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "GENERATE QR",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            qrData == null
                ? Image(
                    image: AssetImage('assets/security.png'),
                    height: 320,
                    width: 320,
                  )
                : getQR(qrData),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
        label: Text(
          "DONE",
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.blue[900],
      ),
    );
  }

  Widget getQR(String data){
    return  QrImage(
              data: data,
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            );
  }
}
