import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  Checkout({Key key, this.total}) : super(key: key);
  final int total;
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkout"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Total:${widget.total}",
              style: TextStyle(fontSize: 23),
            ),
          ),
          FlatButton(
              onPressed: () {
                print("This will take you to payment");
              },
              color: Colors.blue,
              child: Text("Make Payment"))
        ],
      )),
    );
  }
}
