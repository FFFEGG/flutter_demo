import 'package:flutter/material.dart';
import 'package:flutter_demo/model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      onPageChanged: (index) => debugPrint("Pages $index"),
      controller: PageController(
        initialPage: 2,
        keepPage: false,
        viewportFraction: 0.85,
      ),
      children: <Widget>[
        Container(
//          color: Colors.pink,
          child: Text(
            '照总',
            style: TextStyle(fontSize: 32.0, color: Colors.pinkAccent),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/keyclack.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
//          color: Colors.pink,
          child: Text(
            '源总',
            style: TextStyle(fontSize: 32.0, color: Colors.blue),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/icecreamtruck.png'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
//          color: Colors.pink,
          child: Text(
            '星总',
            style: TextStyle(fontSize: 32.0, color: Colors.lightGreenAccent),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/gravity-falls.png'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
//          color: Colors.pink,
          child: Text(
            '晨总',
            style: TextStyle(fontSize: 32.0, color: Colors.orange),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://resources.ninghao.org/images/undo.jpg'),
                fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}

class PageViewBuildlerDemo extends StatelessWidget {
  Widget _itemBuilderPage(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(posts[index].author),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _itemBuilderPage,
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTitles(int length) {
    return List.generate(length, (int index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.grey[300],
        child: Text(
          'iTem$index',
          style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildTitles(100),
    );
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _itemBuilderGridView(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: posts.length,
      itemBuilder: _itemBuilderGridView,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0
      ),
    );
  }
}
