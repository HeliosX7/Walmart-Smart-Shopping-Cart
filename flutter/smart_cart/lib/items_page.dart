import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class ItemsPage extends StatefulWidget {
  final String cartNo;
  ItemsPage({Key key, @required this.cartNo}):super( key : key );
  @override
  State<StatefulWidget> createState() => ItemsPageState(cartNo);
}

class ItemsPageState extends State<ItemsPage> {
 
  DatabaseReference itemRef;
  String cartNo;

  ItemsPageState(this.cartNo);

  @override
  void initState() {
    super.initState();
    itemRef = FirebaseDatabase.instance.reference().child("carts").child("cart"+cartNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: FirebaseAnimatedList(
          query: itemRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return Container(
                padding: EdgeInsets.only(left: 15.0,right: 15.0),
                child: Card(
              child: ListTile(
                title: Text(
                  snapshot.value["item"],
                  style: TextStyle(fontFamily: 'Raleway'),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Price : " + snapshot.value["price"],
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    Text(
                      "Quantity : " + snapshot.value["quantity"],
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    Text(
                      "Weight : " + snapshot.value["weight"],
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
              ),
            )
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        icon: Icon(
          Icons.payment,
          color: Colors.black,
        ),
        label: Text(
          "Pay Now",
          style: TextStyle(fontFamily: 'Raleway',color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
      ),
    );
  }
}
