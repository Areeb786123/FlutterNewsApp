import 'package:go_router/go_router.dart';
import 'package:newsappfl/features/data/models/article_model.dart';
import 'package:newsappfl/features/presentation/detail/detail_screen.dart';
import 'package:newsappfl/features/presentation/home/screens/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    routes:[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final article = state.extra as ArticleModel;
          return DetailScreen(article: article);
        },
      ),
    ]
  );
}