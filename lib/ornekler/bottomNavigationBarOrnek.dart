import 'package:flutter/material.dart';

class BottomNavigationBarOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Bottom Nav Demo"),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: Text("Ana Sayfa")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.hotel), title: Text("Otel ara")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.exit_to_app), title: Text("Çıkış")),
        ],
      ),
    );
  }
}
