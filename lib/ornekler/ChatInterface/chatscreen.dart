import 'package:flutter/material.dart';
import 'package:hello_world/ornekler/ChatInterface/chatMessage.dart';

class ChatScreen extends StatefulWidget {
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textEditingController =
      new TextEditingController();

  void _handSubmitted(String value) {
    _textEditingController.clear();
  }

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(children: <Widget>[
        new Flexible(
          child: new TextField(
            controller: _textEditingController,
            onSubmitted: _handSubmitted,
            decoration: new InputDecoration.collapsed(
              hintText: "Yolla mesajını be ya",
            ),
          ),
        ),
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 4.0),
          child: new IconButton(
              icon: new Icon(Icons.send), //new
              onPressed: () => _handSubmitted(_textEditingController.text)),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: _buildTextComposer(),
    );
  }
}
