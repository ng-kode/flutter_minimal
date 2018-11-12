import 'package:flutter/material.dart';

class MatButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MatButtonState();
  }
}

class MatButtonState extends State<MatButton> {
  String dropDownValue = 'drop 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('Raised'),
                onPressed: () {},
              ),
              RaisedButton.icon(
                icon: Icon(Icons.payment),
                label: Text('Raised Icon'),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                child: Text('Flat'),
                onPressed: () {},
              ),
              FlatButton.icon(
                icon: Icon(Icons.payment),
                label: Text('Flat Icon'),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlineButton(
                child: Text('Outline'),
                onPressed: () {},
              ),
              OutlineButton.icon(
                icon: Icon(Icons.payment),
                label: Text('Outline Icon'),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          DropdownButton(
            value: dropDownValue,
            items: ['drop 1', 'drop 2', 'drop 3', 'drop 4']
                .map((val) => DropdownMenuItem(
                      child: Text('$val'),
                      value: val,
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                dropDownValue = val;
              });
            },
          ),
        ],
      )),
    );
  }
}
