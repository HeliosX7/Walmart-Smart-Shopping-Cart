import 'package:flutter/material.dart';
import './items_page.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 120,
          ),
          Image(
            image: AssetImage('assets/logo.png'),
            height: 150,
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                labelText: "Enter Cart Number :  ",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          RaisedButton(
            elevation: 0.0,
            color: Colors.transparent,
            onPressed: () {
              sendCartNo(context);
            },
            child: Container(
              width: 100,
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
                    "NEXT",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  sendCartNo(BuildContext context) {
    String toSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemsPage(
                  cartNo: toSend,
                )));
  }
}
