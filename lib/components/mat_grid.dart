import 'package:flutter/material.dart';

class MatGrid extends StatelessWidget {
  buildTiles(int count, BuildContext context) {
    return List.generate(count, (idx) {
      return Card(
        child: Text('card'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid'),
      ),
      body: Container(
        height: 550.0,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Theme.of(context).accentColor),
        ),
        child: GridView.count(
          // scrollDirection: Axis.horizontal,
          // childAspectRatio: 2.0,
          crossAxisCount: 2,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          children: buildTiles(10, context),
        ),
      ),
    );
  }
}
