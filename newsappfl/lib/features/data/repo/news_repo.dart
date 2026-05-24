import 'package:newsappfl/features/data/models/article_model.dart';

abstract interface class NewsRepo {
  Future<List<ArticleModel>> getNews();
}
