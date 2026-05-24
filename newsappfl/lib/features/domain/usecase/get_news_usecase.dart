import 'package:newsappfl/features/data/models/article_model.dart';
import 'package:newsappfl/features/data/repo/news_repo.dart';

class GetNewsUseCase {
  final NewsRepo newsRepo;
  GetNewsUseCase(this.newsRepo);
  Future<List<ArticleModel>> call() async {
    try {
      final news = await newsRepo.getNews();
      return news;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
