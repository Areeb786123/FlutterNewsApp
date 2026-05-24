import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:newsappfl/features/data/models/article_model.dart';
import 'package:newsappfl/features/presentation/home/notifier/news_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsnotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: newsState.isLoading
                ? null
                : () => ref.read(newsnotifierProvider.notifier).fetchNews(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(newsnotifierProvider.notifier).fetchNews(),
        child: newsState.when(
          data: (articles) => articles.isEmpty
              ? const _EmptyNewsView()
              : _NewsList(articles: articles),
          error: (error, stackTrace) => _ErrorNewsView(
            message: error.toString(),
            onRetry: () => ref.read(newsnotifierProvider.notifier).fetchNews(),
          ),
          loading: () => const _LoadingNewsList(),
        ),
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: articles.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) => _ArticleCard(article: articles[index]),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final publishedDate = _formatDate(article.publishedAt);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          context.push('/detail', extra: article);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  imageUrl: article.imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey.shade200),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported_outlined),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title.isEmpty ? 'Untitled news' : article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  if (article.description != null &&
                      article.description!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      article.description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                        height: 1.35,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          article.author?.isNotEmpty == true
                              ? article.author!
                              : 'News source',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelMedium?.copyWith(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (publishedDate != null) ...[
                        const SizedBox(width: 12),
                        Text(
                          publishedDate,
                          style: textTheme.labelMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _formatDate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final date = DateTime.tryParse(value);
    if (date == null) {
      return null;
    }

    return DateFormat('MMM d').format(date.toLocal());
  }
}

class _LoadingNewsList extends StatelessWidget {
  const _LoadingNewsList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: 5,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) => const _LoadingArticleCard(),
    );
  }
}

class _LoadingArticleCard extends StatelessWidget {
  const _LoadingArticleCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container(color: Colors.grey.shade200)),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: const [
                _SkeletonLine(widthFactor: 1),
                SizedBox(height: 10),
                _SkeletonLine(widthFactor: .74),
                SizedBox(height: 18),
                _SkeletonLine(widthFactor: .42),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({required this.widthFactor});

  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      alignment: Alignment.centerLeft,
      child: Container(
        height: 12,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 151, 49, 49),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}

class _EmptyNewsView extends StatelessWidget {
  const _EmptyNewsView();

  @override
  Widget build(BuildContext context) {
    return const _CenteredStateView(
      icon: Icons.article_outlined,
      title: 'No articles found',
      message: 'Pull down to refresh the latest stories.',
    );
  }
}

class _ErrorNewsView extends StatelessWidget {
  const _ErrorNewsView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return _CenteredStateView(
      icon: Icons.wifi_off_outlined,
      title: 'Could not load news',
      message: message,
      action: FilledButton.icon(
        onPressed: onRetry,
        icon: const Icon(Icons.refresh),
        label: const Text('Try again'),
      ),
    );
  }
}

class _CenteredStateView extends StatelessWidget {
  const _CenteredStateView({
    required this.icon,
    required this.title,
    required this.message,
    this.action,
  });

  final IconData icon;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24),
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .18),
        Icon(icon, size: 44, color: Colors.grey.shade600),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
        ),
        if (action != null) ...[
          const SizedBox(height: 20),
          Center(child: action),
        ],
      ],
    );
  }
}
