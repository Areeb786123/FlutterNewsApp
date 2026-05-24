import 'package:dio/dio.dart';
import 'package:newsappfl/core/constants/api_constants/api_constants.dart';
import 'package:newsappfl/features/data/models/article_model.dart';
import 'package:newsappfl/features/data/models/response_model.dart';

abstract class RemoteDataSource {
  Future<List<ArticleModel>> getNews();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl(this.dio);

  @override
  Future<List<ArticleModel>> getNews() async {
    final response = await dio.get(
      ApiConstants.topHeadlines,
      queryParameters: const {'country': 'us', 'apiKey': ApiConstants.apiKey},
    );
    final data = NewsResponseModel.fromJson(response.data);
    return data.articles;
  }
}
