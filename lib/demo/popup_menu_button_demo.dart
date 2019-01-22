import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  PopupMenuButtonDemoState createState() {
    return new PopupMenuButtonDemoState();
  }
}

class PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String Tiele = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(Tiele),
                PopupMenuButton(
                  onSelected: (val) {
//                    print(val);
                    setState(() {
                      Tiele = val;
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(child: Text('Home'),value: 'Home',),
                    PopupMenuItem(child: Text('Cate'),value: 'Cate',),
                    PopupMenuItem(child: Text('About'),value: 'About',),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}