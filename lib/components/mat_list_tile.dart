import 'package:flutter/material.dart';

class _MatTile extends StatefulWidget {
  final String title;
  final bool isLiked;
  _MatTile(this.title, {this.isLiked = false});

  @override
  _MatTileState createState() {
    return new _MatTileState(title, isLiked);
  }
}

class _MatTileState extends State<_MatTile> {
  String title;
  bool isLiked;
  _MatTileState(this.title, this.isLiked);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text(title),
      subtitle: Text(
          'Even more additional list item information appears on line three.'),
      isThreeLine: true,
      trailing: IconButton(
        icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
      ),
      onTap: () {},
    );
  }
}

class MatListTile extends StatelessWidget {
  List<Widget> buildTiles(BuildContext context, int count) {
    final tiles = List.generate(count, (int index) {
      return _MatTile('Tile $count');
    });

    return ListTile.divideTiles(tiles: tiles, context: context).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Tile'),
      ),
      body: ListView(
        children: buildTiles(context, 3),
      ),
    );
  }
}
