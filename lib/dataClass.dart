import 'package:uas_ambw_c14190018/postsClass.dart';

class DataPost {
  DataPost({
    required this.link,
    required this.description,
    required this.title,
    required this.image,
    required this.posts,
  });

  String link;
  String description;
  String title;
  String image;
  List<PostsClass> posts;

  factory DataPost.fromJson(Map<String, dynamic> json) => DataPost(
        link: json["link"],
        description: json["description"],
        title: json["title"],
        image: json["image"],
        posts: List<PostsClass>.from(
            json["posts"].map((x) => PostsClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "description": description,
        "title": title,
        "image": image,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}
