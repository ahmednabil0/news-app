class Article{
  String title;
  String urlToImage;
  String url;
  Article({
    required this.title,
    required this.urlToImage,
    required this.url,
  });



  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'urlToImage': urlToImage});
    result.addAll({'url': url});
  
    return result;
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      url: map['url'] ?? '',
    );
  }

}