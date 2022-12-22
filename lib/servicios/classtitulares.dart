
import 'dart:convert';

class AbcTitulares {
    AbcTitulares({
       required this.status,
       required this.totalResults,
       required this.articles,
    });

    String status;
    int totalResults;
    List<Articles> articles;

    factory AbcTitulares.fromJson(String str) => AbcTitulares.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AbcTitulares.fromMap(Map<String, dynamic> json) => AbcTitulares(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Articles>.from(json["articles"].map((x) => Articles.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
    };
}

class Articles {
    Articles({
  
      required  this.author,
      required  this.title,
      required  this.description,
      required  this.url,
      required  this.urlToImage,
      required  this.publishedAt,
      required  this.content,
    });

 
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Articles.fromJson(String str) => Articles.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Articles.fromMap(Map<String, dynamic> json) => Articles(
   
        author: json["author"] ?? 'author',
        title: json["title"],
        description: json["description"]?? 'description',
        url: json["url"],
        urlToImage: json["urlToImage"] ?? 'https://www.shutterstock.com/image-photo/man-reading-news-on-tablet-260nw-726843034.jpg',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'content',
    );

    Map<String, dynamic> toMap() => {

        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
    };
}

