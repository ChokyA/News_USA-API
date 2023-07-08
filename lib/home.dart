// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:news_api/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter News')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: posts[index]['urlToImage'] != null ?
                   Image.network(posts[index]['urlToImage'])
                  : const Center(),
            ),
            title: Text('${posts[index]['title']}'),
            subtitle: Text('${posts[index]['description']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => Detail()),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2023-06-08&sortBy=publishedAt&apiKey=90f3710beacd40fa9f009a27fb4430b4'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final fetchedPosts = data['articles'] as List<dynamic>;

        setState(() {
          posts = fetchedPosts;
        });
        print(posts);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
