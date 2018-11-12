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
    return Dismissible(
      key: ObjectKey(title),
      direction: DismissDirection.horizontal,
      onDismissed: (DismissDirection direction) {},
      child: ListTile(
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
      ),
      background: Container(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          leading: Icon(Icons.share),
          title: Text('Share $title'),
        ),
      ),
      secondaryBackground: Container(
        color: Theme.of(context).errorColor,
        child: ListTile(
          leading: Icon(Icons.archive),
          title: Text('Archive $title'),
        ),
      ),
    );
  }
}

class MatSwipeableTile extends StatelessWidget {
  List<Widget> buildTiles(BuildContext context, int count) {
    final tiles = List.generate(count, (int index) {
      return _MatTile('News Feed $count');
    });

    return ListTile.divideTiles(tiles: tiles, context: context).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipeable List Tile'),
      ),
      body: ListView(
        children: buildTiles(context, 3),
      ),
    );
  }
}
