import 'package:StateManagement/data.dart';
import 'package:StateManagement/inheritedWidget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var showAlreadyAdded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Data cartData = CommonForAll.of(context).data;
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo Online Shopping'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('select');
                },
                child: Badge(
                  badgeContent: cartData.listOfItems.isEmpty
                      ? Text(
                          "0",
                          style: TextStyle(fontSize: 15),
                        )
                      : Text(
                          "${cartData.selectedItem.length}",
                          style: TextStyle(fontSize: 15),
                        ),
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 32.0,
                  ),
                ))
          ],
        ),
        body: Stack(
          children: <Widget>[
            ListView.separated(
                itemBuilder: (_, int index) {
                  return Container(
                    height: 120,
                    color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Card(
                              child: Text(
                                  "${cartData.listOfItems[index].itemName}"),
                            ),
                          ],
                        ),
                        Text("${cartData.listOfItems[index].itemDescription}"),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              height: 30,
                              width: 50,
                              child: Text(
                                  "Rs.${cartData.listOfItems[index].itemPrice}"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 300),
                              child: GestureDetector(
                                onTap: () {
                                  if (cartData.selectedItem
                                      .contains(cartData.listOfItems[index])) {
                                    setState(() {
                                      showAlreadyAdded = true;
                                    });
                                  } else {
                                    setState(() {
                                      cartData.selectedItem
                                          .add(cartData.listOfItems[index]);
                                      print(cartData.selectedItem);
                                    });
                                  }
                                },
                                child: Container(
                                    color: Colors.blue,
                                    height: 30,
                                    width: 50,
                                    child: FittedBox(
                                      child: Column(
                                        children: <Widget>[
                                          Icon(Icons.add_shopping_cart),
                                          Text("Add to cart")
                                        ],
                                      ),
                                    )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: cartData.listOfItems.length),
            showAlreadyAdded
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Already added in cart.Go to cart and increment if you need more",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  showAlreadyAdded = false;
                                });
                              },
                              child: Icon(Icons.cancel))
                        ],
                      ),
                      color: Colors.red,
                    ),
                  )
                : Text(''),
          ],
        ));
  }
}
