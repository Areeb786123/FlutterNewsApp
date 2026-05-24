// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteDataSource)
final remoteDataSourceProvider = RemoteDataSourceProvider._();

final class RemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RemoteDataSource,
          RemoteDataSource,
          RemoteDataSource
        >
    with $Provider<RemoteDataSource> {
  RemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RemoteDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RemoteDataSource create(Ref ref) {
    return remoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteDataSource>(value),
    );
  }
}

String _$remoteDataSourceHash() => r'4c73e192b6ef89cfb964215a431c0749e991f3c2';

@ProviderFor(newsRepository)
final newsRepositoryProvider = NewsRepositoryProvider._();

final class NewsRepositoryProvider
    extends $FunctionalProvider<NewsRepo, NewsRepo, NewsRepo>
    with $Provider<NewsRepo> {
  NewsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsRepositoryHash();

  @$internal
  @override
  $ProviderElement<NewsRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NewsRepo create(Ref ref) {
    return newsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewsRepo>(value),
    );
  }
}

String _$newsRepositoryHash() => r'1496ee96ae8cdaf980d7eeb9cc8f0cea15d3d933';
