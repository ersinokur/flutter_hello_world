import 'package:flutter/material.dart';

class OriantationListDemo extends StatelessWidget {
  final String title;
  OriantationListDemo({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            // Create a grid with 2 columns in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            // Generate 100 Widgets that display their index in the List
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
