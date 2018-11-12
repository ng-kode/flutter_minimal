import 'package:flutter/material.dart';

class MatSnackBar extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Snack Bar'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Press Me'),
          onPressed: () {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('This is a text message in snackbar.'),
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: () {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Yes you get it's snackbar again."),
                    ));
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
