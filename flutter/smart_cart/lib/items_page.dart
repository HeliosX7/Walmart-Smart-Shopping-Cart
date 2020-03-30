import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'payment_page.dart';

class ItemsPage extends StatefulWidget {
  final String cartNo;
  ItemsPage({Key key, @required this.cartNo}) : super(key: key);
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
    itemRef = FirebaseDatabase.instance
        .reference()
        .child("carts")
        .child("cart" + cartNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        //elevation: 0.0,
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow,letterSpacing: 1.5),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0, left: 20, right: 20),
        child: FirebaseAnimatedList(
          query: itemRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            return Container(
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 10.0),
                  ]),
              child: ListTile(
                title: Text(
                  snapshot.value["item"],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Price : " + snapshot.value["price"],
                    ),
                    Text(
                      "Quantity : " + snapshot.value["quantity"],
                    ),
                    Text(
                      "Weight : " + snapshot.value["weight"],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => Payment() ));
        },
        icon: Icon(
          Icons.payment,
          color: Colors.white,
        ),
        label: Text(
          "PAY NOW",
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
