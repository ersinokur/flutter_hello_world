import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

final String text="";
//chatMessage({this.text});
String _name = "Your Name";

  @override
  Widget build(BuildContext context) {
    return Container(
margin: const EdgeInsets.symmetric(vertical: 10.0),
child: new Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    new Container(
      margin: const EdgeInsets.only(right:16.0),
      child:new CircleAvatar(
        child: new Text(_name[0])
      ),
      
    )
  ],
)
    );
  }
}