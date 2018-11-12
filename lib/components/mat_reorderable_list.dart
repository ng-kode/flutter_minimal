import 'package:flutter/material.dart';

class MatReorderableList extends StatefulWidget {
  @override
  MatReorderableListState createState() {
    return new MatReorderableListState();
  }
}

class MatReorderableListState extends State<MatReorderableList> {
  List<String> _items = ['A', 'B', 'C', 'D'];

  Widget buildTile(item) {
    // This methods needs to be run inside build
    // in order to create new Key
    // on every reordering
    return ListTile(
      key: Key(item),
      leading: Icon(Icons.drag_handle),
      title: Text('Tile $item'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reorderable List')),
      body: ReorderableListView(
        children: _items.map(buildTile).toList(),
        onReorder: (int oldIndex, int newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          setState(() {
            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
