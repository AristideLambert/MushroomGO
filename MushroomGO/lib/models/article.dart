class Article {
  final String title;
  final String imageUrl;
  final String url;

  Article({
    required this.title,
    required this.imageUrl,
    required this.url,
  });

  factory Article.fromMap(Map<String, Object?> data) {
    return Article(
      title: data['title'].toString(),
      imageUrl: data['image_url'].toString(),
      url: data['url'].toString(),
    );
  }
}
