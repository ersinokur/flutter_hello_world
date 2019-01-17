import 'package:flutter/material.dart';

class OrtadaKutu extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: new Container(
        child: new Text("deneme"),
        //margin: EdgeInsets.all(50.0),
        alignment: Alignment.center,
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
    );
  }
}
