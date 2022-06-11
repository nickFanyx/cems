class NewsModel {
  final String user_id;
  final String news_id;
  final String news_title;
  final String news_description;
  final String news_details;

  NewsModel(
    this.user_id,
    this.news_id,
    this.news_title,
    this.news_description,
    this.news_details,
  );

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'news_id': news_id,
        'news_title': news_title,
        'news_description': news_description,
        'news_details': news_details,
      };
}
