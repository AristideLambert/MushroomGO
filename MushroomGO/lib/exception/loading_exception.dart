class LoadingException implements Exception {
  final String title;
  final String content;

  LoadingException(this.title, this.content);

  @override
  String toString() {
    return "LoadingException ($title): $content";
  }
}