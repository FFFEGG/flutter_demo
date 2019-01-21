import 'package:flutter/material.dart';

import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            leading: Text('FiveEggs'),
//            title: Text('FiveEggs'),
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('小鸡蛋Test！'),
              background: Image.network(
                'https://resources.ninghao.org/images/say-hello-to-barry.jpg',
                fit: BoxFit.cover,
              ),
            ),

//            floating: false,
//            pinned: true,
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}
class SliverGridDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            leading: Text('FiveEggs'),
//            title: Text('FiveEggs'),
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('小鸡蛋Test！'),
              background: Image.network(
                'https://resources.ninghao.org/images/say-hello-to-barry.jpg',
                fit: BoxFit.cover,
              ),
            ),

//            floating: false,
//            pinned: true,
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Material(
            elevation: 20.0,
            shadowColor: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(13.0),
            child: Stack(children: <Widget>[
              Container(
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    image: DecorationImage(
                        image: NetworkImage(
                          posts[index].imageUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 32.0,
                left: 32.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      posts[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      posts[index].author,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ]),
          ),
        );
      }, childCount: posts.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3 / 4),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        );
      }, childCount: posts.length),
    );
  }
}
