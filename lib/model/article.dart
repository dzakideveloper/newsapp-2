class Article{
  String author;
  String title;
  String content;
  String urlToImage;
  String publishedAt;

  Article({required this.author, required this.title, required this.content, required this.urlToImage, required this.publishedAt});
  //memetakan json object ke model
  //untuk belajar kalian bisa melihat di https://ichi.pro/id/mengurai-json-kompleks-di-flutter-27300625035333
  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"] ?? "Null",
        author: json["author"] ?? "Null",
        urlToImage: json["urlToImage"] ??
            "https://www.btklsby.go.id/images/placeholder/basic.png",
        content: json["content"] ?? "Null",
        publishedAt: json["publishedAt"] ?? "Null",
      );
}