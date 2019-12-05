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
      Navigator.push(
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
              color: Colors.blue,
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
                      backgroundColor: Colors.yellow,
                      radius: 50.0,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 60.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Smart Cart",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 36.0,
                        color: Colors.white,
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
                      backgroundColor : Colors.yellow,
                    ),
                   /* Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Loading...",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                    */
                  ],
                ),
              ),
            ],
          )
        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => CartPage() ));
        },
        child: Icon(
          Icons.navigate_next,
          color: Colors.yellow,
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
