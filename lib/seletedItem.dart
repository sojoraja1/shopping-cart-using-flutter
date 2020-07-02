import 'package:StateManagement/data.dart';
import 'package:StateManagement/inheritedWidget.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  MyCart({Key key}) : super(key: key);
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var total = 0;
  Widget updating(Data cartData, int index) {
    if (cartData.selectedItem[index].itemCount == 0) {
      return Text("${cartData.selectedItem[index].itemPrice}");
    }
    return Text(
        "${cartData.selectedItem[index].itemPrice * cartData.selectedItem[index].itemCount}");
  }

  @override
  Widget build(BuildContext context) {
    Data cartData = CommonForAll.of(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  cartData.selectedItem.clear();
                });
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView.separated(
              itemBuilder: (_, int index) {
                return Container(
                  height: 100,
                  color: Colors.yellow,
                  child: Column(
                    children: <Widget>[
                      Text("${cartData.selectedItem[index].itemName}"),
                      updating(cartData, index),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  cartData.selectedItem[index].decrementIt();
                                });
                              },
                              child: Text(
                                "-",
                                style: TextStyle(fontSize: 38),
                              )),
                          Text(
                            "${cartData.selectedItem[index].itemCount}",
                            style: TextStyle(fontSize: 28),
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  cartData.selectedItem[index].incrementIt();
                                });
                              },
                              child: Text(
                                "+",
                                style: TextStyle(fontSize: 28),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, int index) {
                return SizedBox(
                  height: 23,
                );
              },
              itemCount: cartData.selectedItem.length),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            for (int i = 0; i < cartData.selectedItem.length; i++) {
              total = total +
                  cartData.selectedItem[i].itemPrice *
                      cartData.selectedItem[i].itemCount;
            }

            print(total);
          });

          Navigator.of(context)
              .pushReplacementNamed('checkout', arguments: total);
        },
        child: Container(
          child: Card(
            child: Text("Check out"),
            color: Colors.blue,
          ),
          height: 70,
          width: 100,
        ),
      ),
    );
  }
}
