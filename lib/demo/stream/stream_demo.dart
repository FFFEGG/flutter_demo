import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo = StreamController.broadcast();
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('创建stream');

//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('开始监听stream');
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onDone: onDone, onError: onError);

//  _streamDemo.stream.listen(onDataTwo,onDone: onDone,onError: onError);

    _sinkDemo = _streamDemo.sink;

    print('创建完成');
  }

  onData(String data) {
    setState(() {
      _data = data;
    });

    print('$data');
  }

  onDataTwo(String data) {
    print('onDataTwo:$data');
  }

  onDone() {
    print('Done!');
  }

  onError(data) {
    print('Error:$data');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
//    throw 'error!';
    return 'Hello ~';
  }

  _pasueStream() {
    print('Pasue subscriptiom');
    _streamDemoSubscription.pause();
  }

  _resumeStream() {
    print('Resume subscriptiom');
    _streamDemoSubscription.resume();
  }

  _cancelStream() {
    print('Cancle subscriptiom');
    _streamDemoSubscription.cancel();
  }

  _addDataStream() async {
    print('Add Data to subscriptiom');

    String data = await fetchData();

//    _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: Column(
//        padding: EdgeInsets.all(16.0),
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          Text(_data),
          StreamBuilder(
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            },
            initialData: '...',
            stream: _streamDemo.stream,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Add'),
                onPressed: _addDataStream,
              ),
              FlatButton(
                child: Text('Pause'),
                onPressed: _pasueStream,
              ),
              FlatButton(
                child: Text('Resume'),
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: _cancelStream,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
