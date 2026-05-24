import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsappfl/features/data/models/article_model.dart';
import 'package:newsappfl/features/data/repo/news_repo.dart';
import 'package:newsappfl/features/domain/providers/repo_providers/repo_providers.dart';
import 'package:newsappfl/main.dart';

void main() {
  testWidgets('shows latest news list', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [newsRepositoryProvider.overrideWithValue(_FakeNewsRepo())],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Daily News'), findsOneWidget);
    expect(find.text('Test headline'), findsOneWidget);
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });
}

class _FakeNewsRepo implements NewsRepo {
  @override
  Future<List<ArticleModel>> getNews() async {
    return [
      ArticleModel(
        title: 'Test headline',
        description: 'A short test description for the home screen.',
        author: 'Test source',
        publishedAt: '2026-05-24T00:00:00Z',
      ),
    ];
  }
}
