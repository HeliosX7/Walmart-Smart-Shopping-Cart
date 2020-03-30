import 'package:flutter/material.dart';
import './cart_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CartPage() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blue[900],
                      radius: 50.0,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.yellow,
                        size: 60.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Smart Cart",
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      //value: 0.9,
                      backgroundColor : Colors.blue[900],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      /*
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartPage() ));
        },
        child: Icon(
          Icons.navigate_next,
          color: Colors.blue[900],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      */
    );
  }
}
