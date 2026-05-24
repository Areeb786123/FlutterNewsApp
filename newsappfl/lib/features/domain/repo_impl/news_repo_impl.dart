import 'package:newsappfl/features/data/data_source/remote_data_source.dart';
import 'package:newsappfl/features/data/models/article_model.dart';
import 'package:newsappfl/features/data/repo/news_repo.dart';

class Newsrepoimpl implements NewsRepo {
  final RemoteDataSource remoteDataSource;
  Newsrepoimpl(this.remoteDataSource);
  @override
  Future<List<ArticleModel>> getNews() async {
    try {
      final response = await remoteDataSource.getNews();
      return response;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
