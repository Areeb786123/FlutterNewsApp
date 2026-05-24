import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsappfl/features/data/models/article_model.dart';

class DetailScreen extends StatelessWidget {
  final ArticleModel article;

  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: CustomScrollView(
        slivers: [
          // Hero image + back button
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF0D0D0D),
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: article.imageUrl != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          article.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildPlaceholder(),
                        ),
                        // gradient overlay
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                const Color(0xFF0D0D0D).withOpacity(0.8),
                                const Color(0xFF0D0D0D),
                              ],
                              stops: const [0.3, 0.7, 1.0],
                            ),
                          ),
                        ),
                      ],
                    )
                  : _buildPlaceholder(),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meta row: author + date
                  Row(
                    children: [
                      if (article.author != null) ...[
                        const Icon(Icons.person_outline,
                            size: 14, color: Color(0xFF888888)),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            article.author!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF888888),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      if (article.publishedAt != null) ...[
                        const Icon(Icons.schedule,
                            size: 14, color: Color(0xFF888888)),
                        const SizedBox(width: 4),
                        Text(
                          _formatDate(article.publishedAt!),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Title
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Divider
                  Container(
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE53935),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description
                  if (article.description != null) ...[
                    Text(
                      article.description!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFCCCCCC),
                        height: 1.7,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Content
                  if (article.content != null)
                    Text(
                      article.content!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFFAAAAAA),
                        height: 1.8,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: const Color(0xFF1A1A1A),
      child: const Center(
        child: Icon(Icons.image_not_supported_outlined,
            size: 48, color: Color(0xFF444444)),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day} ${_month(date.month)} ${date.year}';
    } catch (_) {
      return dateStr;
    }
  }

  String _month(int m) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[m - 1];
  }
}