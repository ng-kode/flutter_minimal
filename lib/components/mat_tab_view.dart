import 'package:flutter/material.dart';
import '../constants.dart';

class MatTabView extends StatelessWidget {
  final _tabs = <Widget>[
    Tab(
      child: Text('Demo Tab 1'),
    ),
    Tab(
      child: Text('Demo Tab 2'),
    ),
    Tab(
      child: Text('Demo Tab 3'),
    ),
    Tab(
      child: Text('Demo Tab 4'),
    ),
    Tab(
      child: Text('Demo Tab 5'),
    ),
    Tab(
      child: Text('Demo Tab 6'),
    ),
  ];

  Widget buildPageOne() {
    final assetPaths = [
      '$imageDir/thinking_face.png',
      '$imageDir/joy_face.png',
      '$imageDir/sunglasses_face.png',
    ];

    return ListView(
      children: assetPaths
          .map((path) => Card(
                margin: EdgeInsets.all(10.0),
                child: Container(
                  height: 250.0,
                  padding: EdgeInsets.all(40.0),
                  child: Image.asset(path),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Views'),
          bottom: TabBar(
            tabs: _tabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            buildPageOne(),
            Icon(Icons.favorite),
            Icon(Icons.videocam),
            Icon(Icons.calendar_today),
            Icon(Icons.cake),
            Icon(Icons.business_center)
          ],
        ),
      ),
    );
  }
}
