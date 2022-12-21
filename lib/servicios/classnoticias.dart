
import 'dart:convert';

class AbCnoticias {
    AbCnoticias({
       required this.status,
       required this.totalResults,
       required this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory AbCnoticias.fromJson(String str) => AbCnoticias.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AbCnoticias.fromMap(Map<String, dynamic> json) => AbCnoticias(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
    };
}

class Article {
    Article({
       required this.author,
       required this.title,
       required this.description,
       required this.url,
       required this.urlToImage,
       required this.publishedAt,
       required this.content,
    });


    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Article.fromMap(Map<String, dynamic> json) => Article(
        author: json["author"],
        title: json["title"],
        description: json["description"], 
        url: json["url"],
        urlToImage: json["urlToImage"] ?? 'https://www.shutterstock.com/image-photo/man-reading-news-on-tablet-260nw-726843034.jpg',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

enum Author { BBC_NEWS, BBC_SPORT }

