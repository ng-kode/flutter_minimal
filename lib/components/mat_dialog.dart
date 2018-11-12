import 'package:flutter/material.dart';

import '../constants.dart';

class MatDialog extends StatelessWidget {
  buildDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context2) {
          return AlertDialog(
            title: Text('Alert Dialog Title'),
            content: Text('Alert Dialog Content'),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text('OKAY'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  buildDialogNoTitle(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context2) {
        return AlertDialog(
          content: Text('Alert Dialog Content'),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text('OKAY'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  buildSimpleDialog(BuildContext context) {
    final _options = List.generate(3, (idx) {
      return SimpleDialogOption(
        onPressed: () {},
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(avatar_url),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Abcd Efgh'),
          ],
        ),
      );
    });

    return showDialog(
      context: context,
      builder: (context2) {
        return SimpleDialog(
          title: Text('Simple Dialog'),
          children: _options,
        );
      },
    );
  }

  buildFullScreenDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context2) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Full Screen Dialog'),
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Full Screen Dialog Body. \n\nPeople usually put a form \nor T&C here.'),
              ),
            ),
          );
        },
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogs'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Alert'),
                onPressed: () => buildDialog(context),
              ),
              RaisedButton(
                child: Text('Alert No Title'),
                onPressed: () => buildDialogNoTitle(context),
              ),
              RaisedButton(
                child: Text('Simple Dialog'),
                onPressed: () => buildSimpleDialog(context),
              ),
              RaisedButton(
                child: Text('Full Screen Dialog'),
                onPressed: () => buildFullScreenDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
