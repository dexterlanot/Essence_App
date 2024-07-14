import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'responsive_layout.dart';
import 'article_card.dart';
import 'article_service.dart';
import 'bookmark_service.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ArticleService>(context, listen: false).fetchArticles());
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: MobileHomeLayout(),
      desktopBody: DesktopHomeLayout(),
    );
  }
}

class MobileHomeLayout extends StatelessWidget {
  const MobileHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Essence',
            style: TextStyle(fontWeight: FontWeight.w800)),
        actions: const [
          BookmarkButton(),
          ThemeToggle(),
        ],
      ),
      body: ListView(
        children: const [
          SearchBar(),
          CategoryFilter(),
          ArticleGrid(crossAxisCount: 1),
        ],
      ),
    );
  }
}

class DesktopHomeLayout extends StatelessWidget {
  const DesktopHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Essence',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black)),
          ],
        ),
        actions: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchBar(),
            ),
          ),
          BookmarkButton(),
          ThemeToggle(),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryFilter(),
              SizedBox(height: 24),
              ArticleGrid(crossAxisCount: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.bookmark_border),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const BookmarkedArticlesPage()),
        );
      },
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return IconButton(
          icon: Icon(
            themeService.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            themeService.toggleTheme();
          },
        );
      },
    );
  }
}

class BookmarkedArticlesPage extends StatelessWidget {
  const BookmarkedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Articles'),
      ),
      body: Consumer<BookmarkService>(
        builder: (context, bookmarkService, child) {
          final bookmarkedArticles = bookmarkService.bookmarkedArticles;
          if (bookmarkedArticles.isEmpty) {
            return const Center(child: Text('No bookmarked articles'));
          }
          return ListView.builder(
            itemCount: bookmarkedArticles.length,
            itemBuilder: (context, index) {
              final article = bookmarkedArticles[index];
              return ArticleCard(article: article);
            },
          );
        },
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search articles...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
        ),
        onChanged: (value) {
          Provider.of<ArticleService>(context, listen: false)
              .setSearchQuery(value);
        },
      ),
    );
  }
}

class CategoryFilter extends StatelessWidget {
  static const List<Map<String, dynamic>> categories = [
    {'name': 'All', 'icon': Icons.all_inclusive},
    {'name': 'Mental Health', 'icon': Icons.psychology},
    {'name': 'HIV and STD', 'icon': Icons.bloodtype},
    {'name': 'SOGIESC', 'icon': Icons.diversity_3},
  ];

  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Consumer<ArticleService>(
              builder: (context, articleService, child) {
                final isSelected = articleService.selectedCategory ==
                    (categories[index]['name'] == 'All'
                        ? ''
                        : categories[index]['name']);
                return FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        categories[index]['icon'],
                        size: 18,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onSurfaceVariant
                            : Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                      ),
                      const SizedBox(width: 8),
                      Text(categories[index]['name']),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    articleService.setSelectedCategory(
                        categories[index]['name'] == 'All'
                            ? ''
                            : categories[index]['name']);
                  },
                  selectedColor: Theme.of(context).colorScheme.secondary,
                  checkmarkColor: Theme.of(context).colorScheme.onSecondary,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.3)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ArticleGrid extends StatelessWidget {
  final int crossAxisCount;

  const ArticleGrid({super.key, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleService>(
      builder: (context, articleService, child) {
        final articles = articleService.articles;

        if (articles.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: articles.length,
          itemBuilder: (context, index) =>
              ArticleCard(article: articles[index]),
        );
      },
    );
  }
}
