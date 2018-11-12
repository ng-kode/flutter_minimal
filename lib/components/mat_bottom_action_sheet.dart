import 'package:flutter/material.dart';

class MatBottomActionSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MatBottomActionSheetState();
  }
}

class MatBottomActionSheetState extends State<MatBottomActionSheet> {
  showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {},
              ),
              new ListTile(
                leading: new Icon(Icons.photo_album),
                title: new Text('Photos'),
                onTap: () {},
              ),
              new ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {},
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Action Sheet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text('Show Bottom Sheet'),
                onPressed: () => showBottomSheet(context)),
          ],
        ),
      ),
    );
  }
}
