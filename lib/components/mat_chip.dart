import 'package:flutter/material.dart';
import '../constants.dart';

class MatChip extends StatefulWidget {
  @override
  MatChipState createState() {
    return new MatChipState();
  }
}

class MatChipState extends State<MatChip> {
  List<String> _cities = [
    'Hong Kong',
    'Singapore',
    'Tokyo',
    'Tawiwan',
    'Seoul'
  ];
  final List<String> _sports = [
    'badminton',
    'basketball',
    'football',
    'running',
    'yoga'
  ];
  List<String> _selectedSports = [];
  final List<String> _sizes = ['Small', 'Medium', 'Large'];
  String _selectedSize;

  buildSimpleChips() {
    return [
      Chip(
        label: Text('Aaron Burr'),
      ),
      Chip(
        label: Text('Aaron Burr'),
        onDeleted: () {},
      ),
      Chip(
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(avatar_url),
        ),
        label: Text('Aaron Burr'),
      ),
      Chip(
        avatar: CircleAvatar(
          backgroundImage: NetworkImage(avatar_url),
        ),
        label: Text('Aaron Burr'),
        onDeleted: () {},
      ),
    ].toList();
  }

  buildInputChips() {
    return _cities.map((val) {
      return InputChip(
        avatar: Icon(Icons.room),
        label: Text(val),
        onDeleted: () {
          setState(() {
            _cities.remove(val);
          });
        },
      );
    }).toList();
  }

  buildFilterChips() {
    return _sports.map((val) {
      return FilterChip(
        label: Text(val),
        selected: _selectedSports.contains(val),
        onSelected: (isSelected) {
          setState(() {
            if (isSelected) {
              _selectedSports.add(val);
            } else {
              _selectedSports.remove(val);
            }
          });
        },
      );
    }).toList();
  }

  buildChoiceChips() {
    return _sizes.map((val) {
      return ChoiceChip(
        label: Text(val),
        selected: _selectedSize == val,
        onSelected: (isSelected) {
          print(isSelected);
          if (isSelected) {
            setState(() {
              _selectedSize = val;
            });
          }
        },
      );
    }).toList();
  }

  buildAcionChips() {
    List<Widget> chips = [];

    if (_cities.length < 5 || _selectedSize != null) {
      chips.add(ActionChip(
        label: Text('Reset'),
        avatar: Icon(Icons.settings_backup_restore),
        onPressed: () {},
      ));
    }

    if (_selectedSize != null || _selectedSports.length > 0) {
      chips.add(ActionChip(
        label: Text('Save'),
        avatar: Icon(Icons.cloud_upload),
        onPressed: () {},
      ));
    }

    return chips;
  }

  buildChips() {
    final simpleChips = buildSimpleChips();
    final inputChips = buildInputChips();
    final choiceChips = buildChoiceChips();
    final filterChips = buildFilterChips();

    List<Widget> allChips = [];
    allChips.addAll(simpleChips);
    allChips.addAll(inputChips);
    allChips.addAll(choiceChips);
    allChips.addAll(filterChips);

    return allChips;
  }

  buildWrap(List<Widget> children) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8.0,
      runSpacing: 0.0,
      children: children,
    );
  }

  buildSubHeader(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
      child: Text(
        '$text',
        style: TextStyle(fontSize: 15.0, color: Theme.of(context).accentColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chips'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            // Simple Chips
            buildSubHeader('Possible Layouts'),
            buildWrap(buildSimpleChips()),

            // Input Chips
            buildSubHeader('Cities to visit'),
            buildWrap(buildInputChips()),

            // Choice Chips
            buildSubHeader('Choose a size'),
            buildWrap(buildChoiceChips()),

            // Filter Chips
            buildSubHeader('Pick some events'),
            buildWrap(buildFilterChips()),

            // Action Chips
            SizedBox(height: 15.0),
            buildWrap(buildAcionChips()),
          ],
        ),
      ),
    );
  }
}
