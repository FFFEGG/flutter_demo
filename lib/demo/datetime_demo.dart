import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';


class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedTime = DateTime.now();
  TimeOfDay selectedTimer = TimeOfDay(hour: 8,minute: 30);

  void _selectDate() async {
    DateTime data = await showDatePicker(context: context,
        initialDate: selectedTime,
        firstDate: DateTime(1999),
        lastDate: DateTime(2020),
    );

    if (data == null)  return;

    setState(() {
      selectedTime = data;
    });

  }

  void _selectTime() async {
    TimeOfDay time = await showTimePicker(context: context, initialTime: selectedTimer);

    if (time == null)  return;

    setState(() {
      selectedTimer = time;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: _selectDate,
                child: Row(
                  children: <Widget>[
                    Text(DateFormat.yMEd().format(selectedTime)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              InkWell(
                onTap: _selectTime,
                child: Row(
                  children: <Widget>[
                    Text(selectedTimer.format(context)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
