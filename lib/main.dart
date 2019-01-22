import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/basic_demo.dart';
import 'package:flutter_demo/demo/bottom_nabigation_demo.dart';
import 'package:flutter_demo/demo/drawer_demo.dart';
import 'package:flutter_demo/demo/form_demo.dart';
import 'package:flutter_demo/demo/layout_demo.dart';
import 'package:flutter_demo/demo/listviewdemo.dart';
import 'package:flutter_demo/demo/material_compoments.dart';
import 'package:flutter_demo/demo/navigator_demo.dart';
import 'package:flutter_demo/demo/sliver_demo.dart';
import 'package:flutter_demo/demo/view_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //mataerial风格
      home: Home(),
//     home: NavigatorDemo(),
//      initialRoute: '/mdc',
//      routes: {
//        '/': (context) => NavigatorDemo(),
//        '/about': (context) => Page(title: 'Abuout'),
//        '/mdc': (context) => MaterialCompomentsDmoe(),
//      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink, //主题颜色
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
    );
  }
}

class Home extends StatelessWidget {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            //脚手架
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              //导航Appbar
//            leading: IconButton(
//                icon: Icon(Icons.menu),
//                tooltip: 'Navigation',
//                onPressed: () => debugPrint('点击菜单按钮')),
              title: Text('flutter学习'),
              elevation: 0.0,
              //导航栏阴影
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search',
                    onPressed: () => debugPrint('点击搜索按钮')),
              ],
              bottom: TabBar(
                //激活状态
                unselectedLabelColor: Colors.black38,
                //选中下先
                indicatorColor: Colors.black54,
                //大小
                indicatorSize: TabBarIndicatorSize.label,
                //宽度
                indicatorWeight: 1.0,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.airport_shuttle),
                  ),
                  Tab(
                    icon: Icon(Icons.card_giftcard),
                  ),
                  Tab(
                    icon: Icon(Icons.departure_board),
                  ),
                  Tab(
                    icon: Icon(Icons.view_quilt),
                  ),
                  Tab(
                    icon: Icon(Icons.view_quilt),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListViewdemo(),
                BasicDemo(),
                SliverGridDemos(),
                SliverDemo(),
                MaterialCompomentsDmoe(),
              ],
            ),
            drawer: DrawerDemo(),
            bottomNavigationBar: BottomNavigationBarDemo()
        )
    );
  }
}
