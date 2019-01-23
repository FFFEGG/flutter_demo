import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (data, item) {
          return ActionChip(
            label: Text('${item.data}'),
            onPressed: () {
//          _counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        }
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        _counterBloc.log();
          _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc;
  final Widget child;

  CounterProvider({
    this.bloc,
    this.child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;


  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;



  CounterBloc(){
    _counterActionController.stream.listen(onData);
  }



  void onData (int data) {
    print(1);
    _count += data;
    _counterController.add(_count);
  }

  void disponse () {
    _counterActionController.close();
  }

  void log() {
    print('log');
  }
}
