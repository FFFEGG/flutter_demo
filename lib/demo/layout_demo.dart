import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 4/3,
            child: Container(
              color: Colors.pinkAccent,
            ),
          ),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icons;
  final double size;

  IconBadge(this.icons, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icons,
        size: size,
        color: Colors.white,
      ),
      width: size + 60.0,
      height: size + 60.0,
      color: Color.fromRGBO(154, 54, 54, 1.0),
    );
  }
}


class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(13.0)),

//                      child: Icon(
//                        Icons.dashboard,
//                        color: Colors.white,
//                      )
          ),
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
              decoration: BoxDecoration(
//                          color: Color.fromRGBO(45, 46, 45, 1.0),
                  gradient: RadialGradient(
                      colors: [
                        Color.fromRGBO(7, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ]
                  ),
                  borderRadius: BorderRadius.circular(13.0)
              ),
              child: Icon(
                Icons.brightness_2,
                color: Colors.white,
              )),
        ),
        Positioned(
          child: Icon(Icons.ac_unit, size: 22.0, color: Colors.white),
          top: 10.0,
          right: 50.0,
        ),
        Positioned(
          child: Icon(Icons.ac_unit, size: 22.0, color: Colors.white),
          top: 30.0,
          right: 70.0,
        ),
        Positioned(
          child: Icon(Icons.ac_unit, size: 32.0, color: Colors.white),
          top: 50.0,
          right: 30.0,
        ),
        Positioned(
          child: Icon(Icons.ac_unit, size: 13.0, color: Colors.white),
          top: 80.0,
          right: 80.0,
        ),
        Positioned(
          child: Icon(Icons.ac_unit, size: 15.0, color: Colors.white),
          top: 110.0,
          right: 10.0,
        ),
        Positioned(
          child: Icon(Icons.ac_unit, size: 22.0, color: Colors.white),
          top: 130.0,
          right: 60.0,
        ),
        Positioned(
          child: Icon(Icons.ac_unit, size: 32.0, color: Colors.white),
          top: 160.0,
          right: 10.0,
        ),
      ],
    );
  }
}
