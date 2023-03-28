
import 'dart:convert';

ArticlesResult welcomeFromJson(String str) => ArticlesResult.fromJson(json.decode(str));

//String welcomeToJson(ArticlesResult data) => json.encode(data.toJson());

class ArticlesResult {
  ArticlesResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory ArticlesResult.fromJson(Map<String, dynamic> json) => ArticlesResult(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))
        // .where((article) =>
        //     article.author != null &&
        //     article.urlToImage != null &&
        //     article.publishedAt != null &&
        //     article.content != null)
        ),
  );

  // Map<String, dynamic> toJson() => {
  //   "status": status,
  //   "totalResults": totalResults,
  //   "articles": List<dynamic>.from(
  //       articles.map((x) => x.toJson())),
  // };
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  Source source;
  String author;
  String title;
  dynamic description;
  String url;
  dynamic urlToImage;
  DateTime publishedAt;
  dynamic content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  // Map<String, dynamic> toJson() => {
  //   "source": source.toJson(),
  //   "author": author,
  //   "title": title,
  //   "description": description,
  //   "url": url,
  //   "urlToImage": urlToImage,
  //   "publishedAt": publishedAt.toIso8601String(),
  //   "content": content,
  // };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  Id id;
  Name name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: idValues.map[json["id"]]!,
    name: nameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse[id],
    "name": nameValues.reverse[name],
  };
}

enum Id { GOOGLE_NEWS }

final idValues = EnumValues({
  "google-news": Id.GOOGLE_NEWS
});

enum Name { GOOGLE_NEWS }

final nameValues = EnumValues({
  "Google News": Name.GOOGLE_NEWS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
