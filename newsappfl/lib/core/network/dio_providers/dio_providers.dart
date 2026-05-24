import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsappfl/core/constants/api_constants/api_constants.dart';

final dioProviders = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
  dio.interceptors.addAll([LogInterceptor(responseBody: true)]);
  return dio;
});
