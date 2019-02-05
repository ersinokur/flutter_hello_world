import 'package:flutter/material.dart';
import 'package:hello_world/ornekler/MaterialStructureAndLayoutDemo/home.dart';
import 'package:hello_world/ornekler/eoModelDenemeAnlama/screen/listele.dart';
import 'package:hello_world/ornekler/learningdemo.dart';
import 'package:hello_world/ornekler/yakit_takip/screens/verigir.dart';
//import 'package:hello_world/ornekler/tabbaedNavigation.dart';
// import 'ornekler/ortadaKutu.dart';
// import 'ornekler/ortadauckutu.dart';
// import 'ornekler/drawerMenuOrnek.dart';
//import 'ornekler/scoffoldOrnek.dart';
//import 'ornekler/tabbarOrnek.dart';
//import 'ornekler/bottomNavigationBarOrnek.dart';
//import 'ornekler/FancyTabBar//fancytabbardemo.dart';
//import 'ornekler/snackbardemo.dart';
//import 'package:hello_world/ornekler/orientationlist.dart'; --calismadi
//import 'package:hello_world/ornekler/ChatInterface/chatscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "EO app",
        theme: new ThemeData(
            // primarySwatch: Colors.deepPurple,
            ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("List models1"),
          ),
          body: YakitGir(),//Listele(),
        ));
  }
}
