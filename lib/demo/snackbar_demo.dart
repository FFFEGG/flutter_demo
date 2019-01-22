import 'package:flutter/material.dart';



class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBarDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SnackBarBotton()
            ],
          ),
        ],
      ),
    );
  }
}


class SnackBarBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: (){
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('dsadas'),
              action: SnackBarAction(
                  label: 'ok', onPressed: (){}
              ),
            )
          );
        },
        child: Text('showSnackBar')
    );
  }
}

