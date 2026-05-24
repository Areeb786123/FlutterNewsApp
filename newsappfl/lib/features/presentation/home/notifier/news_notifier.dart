import 'package:newsappfl/features/data/models/article_model.dart';
import 'package:newsappfl/features/domain/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_notifier.g.dart';

@riverpod
class Newsnotifier extends _$Newsnotifier {
  @override
  Future<List<ArticleModel>> build() async {
    return _getNews();
  }

  Future<void> fetchNews() async {
    state = const AsyncLoading<List<ArticleModel>>();
    state = await AsyncValue.guard(() async {
      return _getNews();
    });
  }

  Future<List<ArticleModel>> _getNews() {
    final getNewsUseCase = ref.read(getNewsArticlesUseCaseProvider);
    return getNewsUseCase();
  }
}
