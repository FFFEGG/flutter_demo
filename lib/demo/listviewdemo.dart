import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/post_show.dart';
import 'package:flutter_demo/model/post.dart';

class ListViewdemo extends StatelessWidget {
  Widget _listitemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  child: Image.network(
                    posts[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                  aspectRatio: 16 / 9,
                ),
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
            Positioned.fill(
                child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: Colors.white.withOpacity(0.1),
                  splashColor: Colors.white.withOpacity(0.3),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext content) => PostShow(post: posts[index],)
                    ),
                  ),
                ),
            ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listitemBuilder,
    ); //主体;
  }
}
