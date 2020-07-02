import 'package:StateManagement/data.dart';
import 'package:StateManagement/home.dart';
import 'package:StateManagement/inheritedWidget.dart';
import 'package:StateManagement/seletedItem.dart';
import 'package:flutter/material.dart';

import 'checkout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: CommonForAll(
        child: Navigator(
          // ignore: missing_return
          onGenerateRoute: (settings) {
            var args = settings.arguments;
            print(args);
            switch (settings.name) {
              case 'page1':
                return MaterialPageRoute(builder: (_) => Home());
              case 'select':
                return MaterialPageRoute(builder: (_) => MyCart());
              case 'checkout':
                return MaterialPageRoute(builder: (_) => Checkout(total: args,));
            }
          },
          initialRoute: 'page1',
        ),
        data: Data(),
      ),
    );
  }
}
