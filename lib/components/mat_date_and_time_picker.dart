import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart

class _InputDropdown extends StatelessWidget {
  final VoidCallback onPress;
  final String labelText;
  final String valueText;

  _InputDropdown(this.labelText, this.valueText, {this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: labelText,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(valueText),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  @override
  DatePickerState createState() {
    return new DatePickerState();
  }
}

class DatePickerState extends State<DatePicker> {
  DateTime selectedDate;

  void selectDate(BuildContext context) async {
    final now = DateTime.now();

    // firstDate and lastDate are the limits of the picker
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year, now.month),
      initialDate: DateTime(now.year, now.month, now.day),
      lastDate: (now.month < 12)
          ? new DateTime(now.year, now.month + 1, 0)
          : new DateTime(now.year + 1, 1, 0),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InputDropdown(
      'Pick a date',
      selectedDate != null ? DateFormat.yMMMd().format(selectedDate) : '',
      onPress: () {
        selectDate(context);
      },
    );
  }
}

class TimePicker extends StatefulWidget {
  @override
  TimePickerState createState() {
    return new TimePickerState();
  }
}

class TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime;

  void selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InputDropdown(
      'Pick a time',
      selectedTime != null ? selectedTime.format(context) : '',
      onPress: () {
        selectTime(context);
      },
    );
  }
}

class MatDateAndTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date And Time Picker'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: DatePicker(),
          ),
          Expanded(
            flex: 3,
            child: TimePicker(),
          )
        ],
      ),
    );
  }
}
