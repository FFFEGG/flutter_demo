import 'package:flutter/material.dart';


class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr, //从左至右
        style: TextStyle(
          //文字style
            fontSize: 40.0, //大小
            fontWeight: FontWeight.bold, //加粗
            color: Colors.black87 //颜色
        ),
      ),
    );
  }
}
