import 'package:newsappfl/features/domain/providers/repo_providers/repo_providers.dart';
import 'package:newsappfl/features/domain/usecase/get_news_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
GetNewsUseCase getNewsArticlesUseCase(Ref ref) {
  return GetNewsUseCase(ref.read(newsRepositoryProvider));
}
