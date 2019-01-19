import 'package:flutter/material.dart';
import 'model/post.dart';


void main() => runApp(App());



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//mataerial风格
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow//主题颜色
      ),
    );
  }
}


class Home extends StatelessWidget {

  Widget _listitemBuilder (BuildContext context, int index) {
      return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.network(posts[index].imageUrl),
            SizedBox(height: 18.0),
            Text(
              posts[index].title,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              posts[index].author,
              style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox(height: 18.0)
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//脚手架
      backgroundColor: Colors.grey[100],
      appBar: AppBar(//导航Appbar
        title: Text('flutter学习'),
        elevation: 1.0,//导航栏阴影
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listitemBuilder,
      ),//主体
    );
  }
}


class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr,//从左至右
        style: TextStyle(//文字style
            fontSize: 40.0,//大小
            fontWeight: FontWeight.bold,//加粗
            color: Colors.black87//颜色
        ),
      ),
    );
  }
}
