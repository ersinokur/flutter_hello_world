import 'package:flutter/material.dart';


class ScoffoldOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Scoffold Örnek"),
        //appbar'ın sağ tarafını actions widget temsil eder
        actions: <Widget>[
          new Icon(Icons.settings),
          new Icon(Icons.home),
          new Icon(Icons.refresh),
          new Icon(Icons.phone),
        ],
        //appbar'in sol tarafi icin; Leading widget
        leading: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[new Icon(Icons.email), new Text("E-mail")],
        ),
      ),
    );
  }
}
