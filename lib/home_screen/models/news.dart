import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News({
    required this.title,
    required this.description,
    required this.from,
    required this.publishedAt,
    required this.imageURL,
    required this.newsURL,
  });

  final String title;
  final String description;
  final String from;
  final String publishedAt;
  final String imageURL;
  final String newsURL;

  @override
  List<Object> get props => [
        title,
        description,
        from,
        publishedAt,
        imageURL,
        newsURL,
      ];

  factory News.fromJson(Map<String, dynamic> data) {
    final title = data["title"] as String?;
    final description = data["description"] as String?;
    final from = data["source"]["name"] as String?;
    final publishedAt = data["publishedAt"] as String?;
    final imageURL = data["urlToImage"] as String?;
    final newsURL = data["url"] as String;

    return News(
      title: title ?? "",
      description: description ?? "",
      from: from ?? "",
      publishedAt: publishedAt ?? "",
      imageURL: imageURL ??
          "https://as1.ftcdn.net/v2/jpg/03/45/05/92/1000_F_345059232_CPieT8RIWOUk4JqBkkWkIETYAkmz2b75.jpg",
      newsURL: newsURL,
    );
  }
}
