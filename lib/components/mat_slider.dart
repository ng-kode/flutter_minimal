import 'package:flutter/material.dart';

class MatSlider extends StatefulWidget {
  @override
  MatSliderState createState() {
    return new MatSliderState();
  }
}

class MatSliderState extends State<MatSlider> {
  double _value = 55.0;
  double _discreteValue = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Slider(
                    min: 0.0,
                    max: 100.0,
                    value: _value,
                    onChanged: (double value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  Text('Continuous ($_value)')
                ],
              ),
              Column(
                children: <Widget>[
                  Slider(
                    value: 0.25,
                    onChanged: null,
                  ),
                  Text('Disabled'),
                ],
              ),
              Column(
                children: <Widget>[
                  Slider(
                    min: 40.0,
                    max: 100.0,
                    value: _discreteValue,
                    divisions: 60,
                    label: '${_discreteValue.round()}',
                    onChanged: (value) {
                      setState(() {
                        _discreteValue = value;
                      });
                    },
                  ),
                  Text('Discrete')
                ],
              ),
              Column(
                children: <Widget>[
                  SliderTheme(
                    data: Theme.of(context).sliderTheme.copyWith(
                          activeTrackColor: Colors.pink,
                          inactiveTrackColor: Colors.pink[100],
                          thumbColor: Colors.pink,
                          valueIndicatorColor: Colors.pink,
                          overlayColor: Colors.pink[50].withOpacity(0.8),
                        ),
                    child: Slider(
                      min: 40.0,
                      max: 100.0,
                      value: _discreteValue,
                      divisions: 60,
                      label: '${_discreteValue.round()}',
                      onChanged: (value) {
                        setState(() {
                          _discreteValue = value;
                        });
                      },
                    ),
                  ),
                  Text('Custom Color')
                ],
              )
            ],
          ),
        ));
  }
}
