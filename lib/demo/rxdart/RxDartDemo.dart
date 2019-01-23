import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  PublishSubject<String> _subject = PublishSubject<String>();

  @override
  void initState() {
    super.initState();
//    Observable<String> _observable =
//    Observable(Stream.fromIterable(['hello~','您好～']));
//    Observable.fromFuture(Future.value('hello'));
//    Observable.fromIterable(['hello','hi~']);
//    Observable.periodic(Duration(seconds: 1),(x)=>x.toString());
//    Observable.just('heay');x
//    _observable.listen(print);

//
//    PublishSubject<String> _subject = PublishSubject<String>();
//
//    _subject.listen((data){
//      print('listen 1: $data');
//    });
//    _subject.add('Hello');
//    _subject.listen((data){
//      print('listen 2: ${data.toUpperCase()}');
//    });
//    _subject.add('Hello~');

//      BehaviorSubject<String> _subject = BehaviorSubject<String>();
//      ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);
//
//
//      _subject.add('hello');
//      _subject.add('hello!~');
//      _subject.add('hola!~');
//
//      _subject.listen((data){
//        print('listen 1: $data');
//      });
//      _subject.listen((data){
//        print('listen 2: ${data.toUpperCase()}');
//      });
    _subject
//        .map((datas) => 'datas: $datas')
//        .where((item)=>item.length>9)
        .debounce(Duration(milliseconds: 500))
        .listen((data) => print(data));
  }

  @override
  void dispose() {
    super.dispose();
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
      ),
      body: Container(
        child: TextField(
          decoration: InputDecoration(
            labelText: 'title',
            filled: true,
          ),
          onChanged: (value) {
            _subject.add(value);
          },
          onSubmitted: (value) {
            _subject.add('onSubmitted: $value');
          },
        ),
      ),
    );
  }
}
