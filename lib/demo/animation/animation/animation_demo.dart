import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationControllerDemo;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    animationControllerDemo = AnimationController(
//      lowerBound: 50.0,
//      value: 50.0,
//      upperBound: 200.0,
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    curve = CurvedAnimation(
        parent: animationControllerDemo, curve: Curves.bounceIn);

    animation = Tween(begin: 50.0, end: 200.0).animate(curve);

    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    animationControllerDemo.addListener(() {
//      print('${animationControllerDemo.value}');
      setState(() {});
    });

//    animationControllerDemo.forward();//开始动画
    animationControllerDemo.addStatusListener((AnimationStatus status) {
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationControllerDemo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
//      child: ActionChip(
//          label: Text('${animationControllerDemo.value}'),
//          onPressed: () {
//            animationControllerDemo.forward();
//          }),
      child: AnimationHeart(
        animations: [
          animation,
          animationColor
        ],
        controller: animationControllerDemo,
      ),
    );
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimationHeart({
    this.animations,
    this.controller,
  }) : super (listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}
