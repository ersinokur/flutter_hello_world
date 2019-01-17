import 'package:flutter/material.dart';
import 'package:hello_world/ornekler/FancyTabBar/fancytabbar.dart';

class FancyTabBarDemo extends StatefulWidget {
  FancyTabBarDemo({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<FancyTabBarDemo>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text("Tab Bar Animation")),
      bottomNavigationBar: FancyTabBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("you have pushed the button this many times:"),
        ],
      )),
    );
  }
}
