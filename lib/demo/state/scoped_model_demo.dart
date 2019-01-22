import 'package:flutter/material.dart';

class ScopedModelDemo extends StatefulWidget {
  @override
  ScopedModelDemoState createState() {
    return new ScopedModelDemoState();
  }
}

class ScopedModelDemoState extends State<ScopedModelDemo> {
  int _conut = 0;

  void _callback() {
    setState(() {
      _conut += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _conut,
      callback: _callback,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ScopedModelDemo'),
        ),
        body: CounterWarpper(),
        floatingActionButton: FloatingActionButton(
          onPressed: _callback,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}


class CounterWarpper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}


class Counter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final int conut = CounterProvider.of(context).count;
    final VoidCallback callback = CounterProvider.of(context).callback;

    return Center(
      child: ActionChip(
        label: Text('$conut'),
        onPressed: callback,
      ),
    );
  }
}


class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback callback;
  final Widget child;

  CounterProvider({
    this.child,
    this.callback,
    this.count
  });

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}