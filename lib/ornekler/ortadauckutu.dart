import 'package:flutter/material.dart';

class OrtadaUcKutu extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return new Container(
        //alignment: Alignment.center,
        color: Colors.yellow,
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Text("kutu 3"),
              //margin: EdgeInsets.all(50.0),
              alignment: Alignment.center,
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ],
        ));
  }
}
