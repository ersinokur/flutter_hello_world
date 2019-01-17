import 'package:flutter/material.dart';

class DrawerMenuOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Drwaer Demo")),
      drawer: new Drawer(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[   
          //drwaer menu ekleyelim       
          new UserAccountsDrawerHeader(
            accountName: new Text("Ersin OKUR"),
            accountEmail: new Text("eo@gmail.com"),
            currentAccountPicture: new CircleAvatar(
              child: new Icon(Icons.account_circle),
            ),
          ),
          new FlatButton.icon(onPressed: (){},icon: new Icon(Icons.account_circle),label:new Text("Profile")),
          new FlatButton.icon(onPressed: (){},icon: new Icon(Icons.list),label:new Text("Listeler")),
          new FlatButton.icon(onPressed: (){},icon: new Icon(Icons.announcement),label:new Text("Duyurular")),
          new FlatButton.icon(onPressed: (){},icon: new Icon(Icons.local_offer),label:new Text("Siparişler")),
          new FlatButton.icon(onPressed: (){},icon: new Icon(Icons.settings),label:new Text("Ayarlar"),color: Colors.red,),
        ],
      )),
    );
  }
}
