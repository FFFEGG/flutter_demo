import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkactive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CheckboxListTile(
            value: _checkactive,
            onChanged: (val) {
              setState(() {
                _checkactive = val;
              });
            },
            title: Text('请选择我'),
            subtitle: Text('sasigei'),
            secondary: Icon(Icons.record_voice_over),
            selected: _checkactive,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//
//              Checkbox(
//                value: _checkactive,
//                onChanged: (val){
//                  setState(() {
//                    _checkactive = val;
//                  });
//                },
//                activeColor: Colors.black,
//              )
            ],
          ),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatefulWidget {
  @override
  __WidgetDemoState createState() => __WidgetDemoState();
}

class __WidgetDemoState extends State<_WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckBoxDemo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        ));
  }
}
