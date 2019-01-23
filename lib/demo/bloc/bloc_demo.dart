import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/bloc/counter_demo.dart';

class BlocDemo extends StatefulWidget {
  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlockDemo'),
        ),
        body: CounterHome(),
        floatingActionButton: CounterButton(),
      ),
    );
  }
}
