import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
        ),
        body: CounterWarpper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, child, model) => FloatingActionButton(
                onPressed: model.increment,
                child: Icon(Icons.add),
              ),
        ),
      ),
    );
  }
}

//class StateManagementDemoState extends State<StateManagementDemo> {
//  int _conut = 0;
//
//  void _callback() {
//    setState(() {
//      _conut += 1;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return CounterProvider(
//      count: _conut,
//      callback: _callback,
//      child:
//    );
//  }
//}

class CounterWarpper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<CounterModel>(
      builder: (context,child,model) => Center(
        child: ActionChip(
          label: Text('${model.counter}'),
          onPressed: model.increment,
        ),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback callback;
  final Widget child;

  CounterProvider({this.child, this.callback, this.count});

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    // First, increment the counter
    _counter++;

    // Then notify all the listeners.
    notifyListeners();
  }
}
