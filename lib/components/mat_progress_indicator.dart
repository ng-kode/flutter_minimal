import 'package:flutter/material.dart';

class MatProgressIndicator extends StatelessWidget {
  final _value = 0.6;

  _buildCard({Widget child}) {
    return Card(
      child: Container(
        height: 200.0,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator'),
      ),
      body: ListView(
        children: <Widget>[
          _buildCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Intermediate indicators'),
                SizedBox(
                  width: 200.0,
                  child: LinearProgressIndicator(),
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
          _buildCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('"Valued" indicators: $_value'),
                SizedBox(
                  width: 200.0,
                  child: LinearProgressIndicator(value: _value),
                ),
                CircularProgressIndicator(value: _value),
              ],
            ),
          )
        ],
      ),
    );
  }
}
