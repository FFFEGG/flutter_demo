import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

enum Action { No, Ok }

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

  _AlertDialog() async {
    final data = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Rewind and remember'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are You Ok?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Nonono'),
                onPressed: () {
                  Navigator.of(context).pop(Action.No);
                },
              ),
              FlatButton(
                child: Text('Okey~'),
                onPressed: () {
                  Navigator.of(context).pop(Action.Ok);
                },
              ),
            ],
          );
        });

    switch (data) {
      case Action.Ok:
        setState(() {
          _choice = 'ok';
        });
        break;
      case Action.No:
        setState(() {
          _choice = 'No';
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('你的选择是：$_choice'),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('AlertDialog'),
                onPressed: _AlertDialog,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
