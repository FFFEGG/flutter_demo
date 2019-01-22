import 'package:flutter/material.dart';

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

enum Option { A, B, C }

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothig';

  _SimpleDialog() async {
    final data = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              ),
            ],
          );
        });

    switch (data) {
      case Option.A:
        setState(() {
          _choice = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choice = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choice = 'C';
        });
        break;
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('你选择的是：$_choice')],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _SimpleDialog, child: Icon(Icons.format_list_bulleted)),
    );
  }
}
