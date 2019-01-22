import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItem = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Slider(
                  value: _sliderItem,
                  onChanged: (value) {
                    setState(() {
                      _sliderItem = value;
                    });
                  },
                  activeColor: Colors.black38,
                  inactiveColor: Colors.black38.withOpacity(0.3),
                  divisions: 10,
                  max: 10.0,
                  min: 0.0,
                  label: '$_sliderItem',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text('SliderValue:$_sliderItem'),
        ],
      ),
    );
  }
}
