import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
//    getPosts().then((value) => print(value));

//    final post = {'title': 'hello', 'description': 'nice to meet you.'};
//
//    final postJson = json.encode(post);
//    print(postJson);
//
//    final postJsonConverted = json.decode(postJson);
//
//    print(postJsonConverted['title']);
//    print(postJsonConverted['description']);
//    print(postJsonConverted is Map);
//
//    final postModel = Post.formJson(postJsonConverted);
//
//    print('title:${postModel.title},description:${postModel.description}');
//    print('${json.encode(postModel)}');
  }

  Future<List<Post>> getPosts() async {
    final rew =
        await http.post('https://resources.ninghao.net/demo/posts.json');

    if (rew.statusCode == 200) {
      final body = json.decode(rew.body);
      List<Post> posts =
          body['posts'].map<Post>((v) => Post.formJson(v)).toList();

      return posts;
    } else {
      throw Exception('404');
    }

    print('body:${rew.body}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        } else {
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Post(this.title, this.description, this.id, this.author, this.imageUrl);

  Post.formJson(Map json)
      : title = json['title'],
        id = json['id'],
        author = json['author'],
        imageUrl = json['imageUrl'],
        description = json['description'];

  Map toJson() => {'title': title, 'description': description};
}
