class ArticleModel {
  final String title;
  final String? description;
  final String? imageUrl;
  final String? content;
  final String? author;
  final String? publishedAt;

  ArticleModel({
    required this.title,
    this.description,
    this.imageUrl,
    this.content,
    this.author,
    this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      description: json['description'],
      imageUrl: json['urlToImage'],
      content: json['content'],
      author: json['author'],
      publishedAt: json['publishedAt'],
    );
  }
}
