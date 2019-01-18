import 'package:flutter/material.dart';

class TabbedNavigationBarDemo extends StatefulWidget {
  _TabbedNavigationBarDemoState createState() =>
      _TabbedNavigationBarDemoState();
}

class _TabbedNavigationBarDemoState extends State<TabbedNavigationBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _buildTabs().length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: _buildTabs(),
            ),
          ),
        ));
  }

  List<Widget> _buildTabs() {
    return <Widget>[
      Tab(  text: "Home Page",   icon: Icon(Icons.home), ),
      Tab(  text: "Budget",   icon: Icon(Icons.money_off), ),
      Tab(  text: "Setting",   icon: Icon(Icons.settings), ),
    ];
  }
}
