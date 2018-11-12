import 'package:flutter/material.dart';

class MatExpansionTile extends StatelessWidget {
  Widget buildTile(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expantion Tile'),
      ),
      body: ListView(
        children: <Widget>[
          buildTile('A'),
          ExpansionTile(
            title: Text('B'),
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.05),
            children: <Widget>[
              buildTile('B1'),
              buildTile('B2'),
              buildTile('B3'),
            ],
          ),
          buildTile('C'),
        ],
      ),
    );
  }
}
