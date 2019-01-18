import 'package:flutter/material.dart';

class LearningDemos extends StatefulWidget {
  _LearningDemosState createState() => _LearningDemosState();
}

class _LearningDemosState extends State<LearningDemos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("eo"),
        ),
        body: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: SizedBox(                
                width: 150.0,
                height: 250.0,
                child: const Card(
                  color: Colors.blue,
                  child: Text("Credit", textAlign: TextAlign.center,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 40),
              child: SizedBox(
                width: 150.0,
                height: 250.0,
                child: const Card(
                  child: Text(
                    "Debit",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
