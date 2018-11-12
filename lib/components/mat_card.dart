import 'package:flutter/material.dart';

class MatCard extends StatelessWidget {
  double _marginUnit = 6.0;

  // ListView expands the card's width
  // Container controls the card's height
  // 純粹用來dec background & elevation
  // 𠝹layout的話夾parent用好d

  buildCards(int count, BuildContext context) {
    List<Widget> tmp = [];
    for (var i = 0; i < count; i++) {
      tmp.add(
        Card(
          margin: EdgeInsets.symmetric(
            vertical: _marginUnit,
            horizontal: _marginUnit * 2,
          ),
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Theme.of(context).backgroundColor,
            height: 200.0,
            child: Text('Card'),
          ),
        ),
      );
    }
    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card'),
        ),
        body: ListView(
          children: buildCards(3, context),
        ));
  }
}
