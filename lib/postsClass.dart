class PostsClass {
  PostsClass({
    required this.link,
    required this.title,
    required this.pubDate,
    required this.description,
    required this.thumbnail,
  });

  String link;
  String title;
  DateTime pubDate;
  String description;
  String thumbnail;

  factory PostsClass.fromJson(Map<String, dynamic> json) => PostsClass(
        link: json["link"],
        title: json["title"],
        pubDate: DateTime.parse(json["pubDate"]),
        description: json["description"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "title": title,
        "pubDate": pubDate.toIso8601String(),
        "description": description,
        "thumbnail": thumbnail,
      };
}
