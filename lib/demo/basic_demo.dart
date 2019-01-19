import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

//文本
class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Text(
      '汉皇重色思倾国，御宇多年求不得。杨家有女初长成，养在深闺人未识。天生丽质难自弃，一朝选在君王侧。回眸一笑百媚生，六宫粉黛无颜色。春寒赐浴华清池，温泉水滑洗凝脂。侍儿扶起娇无力，始是新承恩泽时。云鬓花颜金步摇，芙蓉帐暖度春宵。翼鸟，在地愿为连理枝。天长地久有时尽，此恨绵绵无绝期。',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

//富文本
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: 'FiveEggs',
            style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: '.org',
                  style: TextStyle(color: Colors.black12, fontSize: 15.0))
            ]),
      ),
    );
  }
}

//简单布局
class ContainerDemo  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://resources.ninghao.org/images/gravity-falls.png'),
            fit: BoxFit.cover
        ),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.airplanemode_inactive,
              size: 32.0,
              color: Colors.white,
            ),
            //背景色
//            color: Color.fromRGBO(3, 164, 44, 0.3),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 164, 44, 1.0),
              //边框
//              border: Border(
//                bottom: BorderSide(
//                  color: Colors.black38,
//                  width: 10.0,
//                  style: BorderStyle.solid
//                )
//              )
              border: Border.all(
                  color: Colors.deepPurple[100],
                  width: 2.0,
                  style: BorderStyle.solid
              ),
              //圆角
//                borderRadius: BorderRadius.circular(30.0),
//                borderRadius: BorderRadius.only(
//                  topLeft: Radius.circular(64.0),
//                  bottomLeft: Radius.circular(64.0),
//                ),
              //阴影
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(34, 156, 76, 0.7),
                    offset: Offset(0.0, 8.0), //偏移
                    blurRadius: 8.0, //模糊程度
                    spreadRadius: -3.0 //缩放
                ),
//                  BoxShadow(
//                      color: Color.fromRGBO(106, 24, 176, 1.0),
//                      offset: Offset(0.0, 8.0),//偏移
//                      blurRadius: 10.0,//模糊程度
//                      spreadRadius: 1.0//缩放
//                  )
              ],
              shape: BoxShape.circle,
              //圆形
              //渐变
//                gradient: RadialGradient(colors: [
//                  Color.fromRGBO(156, 45, 34, 1.0),
//                  Color.fromRGBO(64, 157, 200, 1.0)
//                ]),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(156, 45, 34, 1.0),
                Color.fromRGBO(64, 157, 200, 1.0)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter
              ),

            ),
          )
        ],
      ),
    );
  }
}
