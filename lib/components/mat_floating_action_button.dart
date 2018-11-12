import 'package:flutter/material.dart';

enum _Positions { centerDocked, centerFloat, endDocked, endFloat }
enum _yesNo { yes, no }

class MatFloatingActionButton extends StatefulWidget {
  @override
  MatFloatingActionButtonState createState() {
    return new MatFloatingActionButtonState();
  }
}

class MatFloatingActionButtonState extends State<MatFloatingActionButton> {
  _yesNo isExtended = _yesNo.no;
  _Positions _position = _Positions.endFloat;

  buildFab() {
    if (isExtended == _yesNo.yes) {
      return FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text('Extended'),
      );
    } else {
      return FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );
    }
  }

  buildPosition() {
    switch (_position) {
      case _Positions.centerDocked:
        return FloatingActionButtonLocation.centerDocked;
        break;
      case _Positions.centerFloat:
        return FloatingActionButtonLocation.centerFloat;
        break;
      case _Positions.endDocked:
        return FloatingActionButtonLocation.endDocked;
        break;
      case _Positions.endFloat:
        return FloatingActionButtonLocation.endFloat;
        break;
      default:
        return _Positions.endFloat;
    }
  }

  buildListHeader(String header) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(17.0, 17.0, 17.0, 8.0),
          child: Text('$header'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Action Button'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildListHeader('Extended'),
              RadioListTile(
                  title: Text('Yes'),
                  value: _yesNo.yes,
                  groupValue: isExtended,
                  onChanged: (_yesNo value) {
                    setState(() {
                      isExtended = value;
                    });
                  }),
              RadioListTile(
                  title: Text('No'),
                  value: _yesNo.no,
                  groupValue: isExtended,
                  onChanged: (_yesNo value) {
                    setState(() {
                      isExtended = value;
                    });
                  }),
              buildListHeader('Position'),
              RadioListTile(
                  title: Text('centerDocked'),
                  value: _Positions.centerDocked,
                  groupValue: _position,
                  onChanged: (_Positions value) {
                    setState(() {
                      _position = value;
                    });
                  }),
              RadioListTile(
                  title: Text('centerFloat'),
                  value: _Positions.centerFloat,
                  groupValue: _position,
                  onChanged: (_Positions value) {
                    setState(() {
                      _position = value;
                    });
                  }),
              RadioListTile(
                  title: Text('endDocked'),
                  value: _Positions.endDocked,
                  groupValue: _position,
                  onChanged: (_Positions value) {
                    setState(() {
                      _position = value;
                    });
                  }),
              RadioListTile(
                  title: Text('endFloat'),
                  value: _Positions.endFloat,
                  groupValue: _position,
                  onChanged: (_Positions value) {
                    setState(() {
                      _position = value;
                    });
                  }),
            ],
          ),
        ],
      ),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: buildPosition(),
    );
  }
}
