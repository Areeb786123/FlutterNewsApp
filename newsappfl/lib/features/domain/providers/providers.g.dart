// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getNewsArticlesUseCase)
final getNewsArticlesUseCaseProvider = GetNewsArticlesUseCaseProvider._();

final class GetNewsArticlesUseCaseProvider
    extends $FunctionalProvider<GetNewsUseCase, GetNewsUseCase, GetNewsUseCase>
    with $Provider<GetNewsUseCase> {
  GetNewsArticlesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNewsArticlesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNewsArticlesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetNewsUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetNewsUseCase create(Ref ref) {
    return getNewsArticlesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNewsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNewsUseCase>(value),
    );
  }
}

String _$getNewsArticlesUseCaseHash() =>
    r'3e1e1db41d0581921807d3d1f45cbbed6d3a63c4';
