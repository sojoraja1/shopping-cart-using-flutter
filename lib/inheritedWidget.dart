import 'package:StateManagement/data.dart';
import 'package:flutter/material.dart';

class CommonForAll extends InheritedWidget {
  CommonForAll({Key key, this.child, this.data})
      : super(key: key, child: child);

  final Widget child;
  final Data data;

  static CommonForAll of(BuildContext context) {
    // ignore: deprecated_member_use
    return (context.inheritFromWidgetOfExactType(CommonForAll) as CommonForAll);
  }

  @override
  bool updateShouldNotify(CommonForAll oldWidget) {
    return true;
  }
}
