import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bus)),
              Tab(icon: Icon(Icons.directions_walk)),
            ],
          ),
          title: Text("Tabs Demo"),
         //istersem scfoffold'un actions ve leadig ozelliklerinide kllanabilirim.
        ),
        //sayfainin ortasinda
      body: TabBarView(
        children: <Widget>[          
          Icon(Icons.directions_car),
          Icon(Icons.directions_bus),
          Icon(Icons.directions_walk),
        ],
      )
      
      ,),
      
    );
  }
}
