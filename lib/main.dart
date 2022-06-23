import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uas_ambw_c14190018/dataClass.dart';
import 'package:uas_ambw_c14190018/like.dart';
import 'package:uas_ambw_c14190018/postsClass.dart';
import 'package:uas_ambw_c14190018/responseClass.dart';

import 'service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Service serviceAPI = Service();
  // late Future<List<DataPost>> listposts;
  late Future<ResponseClass> data;

  @override
  void initState() {
    super.initState();
    data = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("HOME"),
          ),
          body: Container(
            child: FutureBuilder<ResponseClass>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ResponseClass isi = snapshot.data!;
                  List<PostsClass> posts = isi.data.posts;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 8,
                        child: ListTile(
                          title: Text(posts[index].title),
                          subtitle: Text(posts[index].description),
                          leading: Image.network(posts[index].thumbnail),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(
                                        link: posts[index].link,
                                        title: posts[index].title,
                                        description: posts[index].description,
                                        pubDate: posts[index].pubDate,
                                        thumbnail: posts[index].thumbnail)));
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          )),
    );
  }
}
