import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('Msg')),
        BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('通讯录')),
        BottomNavigationBarItem(icon: Icon(Icons.cached), title: Text('发现')),
        BottomNavigationBarItem(icon: Icon(Icons.my_location), title: Text('我')),
      ],
    );
  }
}
