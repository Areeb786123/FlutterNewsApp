import 'package:newsappfl/core/network/dio_providers/dio_providers.dart';
import 'package:newsappfl/features/data/data_source/remote_data_source.dart';
import 'package:newsappfl/features/data/repo/news_repo.dart';
import 'package:newsappfl/features/domain/repo_impl/news_repo_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo_providers.g.dart';

@riverpod
RemoteDataSource remoteDataSource(Ref ref) {
  return RemoteDataSourceImpl(ref.read(dioProviders));
}

@riverpod
NewsRepo newsRepository(Ref ref) {
  return Newsrepoimpl(ref.read(remoteDataSourceProvider));
}
