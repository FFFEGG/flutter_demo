import 'package:flutter/material.dart';
import 'dart:async';
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomsheetkey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomsheetkey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_filled),
              SizedBox(
                width: 16.0,
              ),
              Text('01:30  /  03:30'),
              Expanded(
                  child: Text(
                '周杰伦 -- 七里香(亚洲首发)',
                textAlign: TextAlign.right,
              ))
            ],
          ),
        ),
      );
    });
  }

  _openModalBottomSheet() async {
    final data = await showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('A'),
              onTap: (){
                Navigator.of(context).pop('A');
              },
            ),
            ListTile(
              title: Text('B'),
              onTap: (){
                Navigator.of(context).pop('B');
              },
            ),
            ListTile(
              title: Text('C'),
              onTap: (){
                Navigator.of(context).pop('C');
              },
            ),
          ],
        ),
      );
    });

    debugPrint(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomsheetkey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: _openBottomSheet,
                child: Text('BottomSheetDemo'),
              ),
              FlatButton(
                onPressed: _openModalBottomSheet,
                child: Text('ModalBottomSheetD'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
