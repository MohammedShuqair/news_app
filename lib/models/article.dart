class Article {
  String? imageUrl;
  String? url;
  String? title;
  String? date;

  Article({this.imageUrl, this.title, this.date, this.url});

  Article.fromJson(Map<String, dynamic> json) {
    imageUrl = json["urlToImage"];
    title = json["title"];
    date = json["publishedAt"];
    url = json["url"];
  }
  Map<String, dynamic> toJson() {
    return {
      "urlToImage": imageUrl,
      "title": title,
      "publishedAt": date,
      "url": url
    };
  }
}
