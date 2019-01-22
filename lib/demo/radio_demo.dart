import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _groupValue = 0;

  void _radrochange(int index) {
    setState(() {
      _groupValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom:28.0),
            child: Text('选项组：$_groupValue'),
          ),
          RadioListTile(
            value: 0,
            groupValue: _groupValue,
            onChanged: _radrochange,
            title: Text('选项一'),
            subtitle: Text('选项一副标题'),
            secondary: Icon(Icons.filter_1),
            selected: _groupValue==0,
          ),
          RadioListTile(
            value: 1,
            groupValue: _groupValue,
            onChanged: _radrochange,
            title: Text('选项二'),
            subtitle: Text('选项二副标题'),
            secondary: Icon(Icons.filter_1),
            selected: _groupValue==1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Radio(value: 0, groupValue: _groupValue, onChanged: _radrochange),
//              Radio(value: 1, groupValue: _groupValue, onChanged: _radrochange),
//              Radio(value: 2, groupValue: _groupValue, onChanged: _radrochange),
            ],
          ),
        ],
      ),
    );
  }
}
