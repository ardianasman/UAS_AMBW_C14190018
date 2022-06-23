import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detail extends StatefulWidget {
  final String link;
  final String title;
  final String description;
  final DateTime pubDate;
  final String thumbnail;
  const Detail(
      {Key? key,
      required this.link,
      required this.title,
      required this.description,
      required this.pubDate,
      required this.thumbnail})
      : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
        ),
        body: Container(
          child: Column(
            children: [
              Image.network(widget.thumbnail),
              SizedBox(
                height: 20,
              ),
              Text(widget.title),
              SizedBox(
                height: 10,
              ),
              Text(widget.pubDate.toIso8601String()),
              SizedBox(
                height: 20,
              ),
              Text(widget.description),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.favorite)),
                    ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.heart_broken_outlined)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
