class Recipe {
  final String title;
  final String imageUrl;
  final String url;


  Recipe({
    required this.title,
    required this.imageUrl,
    required this.url
  });

  factory Recipe.fromMap(Map<String, Object?> data) {
    return Recipe(
      title: data['title'].toString(),
      imageUrl: data['image_url'].toString(),
      url: data['url'].toString(),
    );
  }
}