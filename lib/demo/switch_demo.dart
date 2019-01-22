import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _actives = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SwitchListTile(
            value: _actives, 
            onChanged: (val) {
              setState(() {
                _actives = val;
              });
            },
            title: Text('Switch Item A'),
            subtitle: Text('Item A'),
            secondary: Icon(_actives? Icons.visibility: Icons.visibility_off),
            selected: _actives,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//              Text(_actives? 'haha':'nonono'),
//              Switch(
//                value: _actives,
//                onChanged: (val) {
//                  setState(() {
//                    _actives = val;
//                  });
//                },
//              ),
            ],
          )
        ],
      ),
    );
  }
}
