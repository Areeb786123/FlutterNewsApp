// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Newsnotifier)
final newsnotifierProvider = NewsnotifierProvider._();

final class NewsnotifierProvider
    extends $AsyncNotifierProvider<Newsnotifier, List<ArticleModel>> {
  NewsnotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'newsnotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$newsnotifierHash();

  @$internal
  @override
  Newsnotifier create() => Newsnotifier();
}

String _$newsnotifierHash() => r'3afa4184dc66db23b2c645cc1bbf940894c34818';

abstract class _$Newsnotifier extends $AsyncNotifier<List<ArticleModel>> {
  FutureOr<List<ArticleModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ArticleModel>>, List<ArticleModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ArticleModel>>, List<ArticleModel>>,
              AsyncValue<List<ArticleModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
