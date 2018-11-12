import 'package:flutter/material.dart';

class MatPopupMenus extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _items = ['Option A', 'Option B', 'Option C', 'Option D'];

  PopupMenuItem buildPopupMenuItem(String item) {
    return PopupMenuItem(
      value: item,
      child: Text(item),
    );
  }

  _onPopupMenuItemSelected(value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('$value selected'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Popup Menus'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('context menu'),
            trailing: PopupMenuButton(
              onSelected: _onPopupMenuItemSelected,
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry> menuEntry =
                    _items.map(buildPopupMenuItem).toList();
                return menuEntry;
              },
            ),
          ),
          ListTile(
            title: Text('context menu with icon and divider'),
            trailing: PopupMenuButton(
              onSelected: _onPopupMenuItemSelected,
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 'Option A',
                    child: ListTile(
                      leading: Icon(Icons.label),
                      title: Text('Option A'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Option B',
                    child: ListTile(
                      leading: Icon(Icons.label),
                      title: Text('Option B'),
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    value: 'Option C',
                    child: ListTile(
                      leading: Icon(Icons.label),
                      title: Text('Option C'),
                    ),
                  )
                ];
              },
            ),
          )
        ],
      ),
    );
  }
}
