import 'package:flutter/material.dart';
import './items_page.dart';

class CartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage>{
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.shopping_basket,
                  color: Colors.black,
                ),
                prefixText: "Enter Cart Number :  ",
                prefixStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat'
                ),
              ),
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          RaisedButton(
            child: Text("Next",style: TextStyle(fontFamily: 'Raleway',fontSize: 30),),
            elevation: 10.0,
            color: Colors.yellow,
            onPressed: (){
              sendCartNo(context);
            },
          )
        ],
      ),
    );
  }

  sendCartNo(BuildContext context){
    String toSend = textFieldController.text;
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context)=> ItemsPage(cartNo: toSend,)
      )
      );
  }

}