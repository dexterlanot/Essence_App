import 'package:flutter/foundation.dart';
import 'article_service.dart';

// Service to manage bookmarks
class BookmarkService extends ChangeNotifier {
  final Set<String> _bookmarkedArticleIds =
      {}; // Set to store bookmarked article IDs
  final List<Article> _allArticles = []; // List to store all articles

// Check if an article is bookmarked
  bool isBookmarked(String articleId) =>
      _bookmarkedArticleIds.contains(articleId);
// Toggle bookmark status for an article
  void toggleBookmark(Article article) {
    if (_bookmarkedArticleIds.contains(article.id)) {
      _bookmarkedArticleIds.remove(article.id);
    } else {
      _bookmarkedArticleIds.add(article.id);
    }
    notifyListeners();
  }

  // Get a list of bookmarked articles
  List<Article> get bookmarkedArticles {
    return _allArticles
        .where((article) => _bookmarkedArticleIds.contains(article.id))
        .toList();
  }

  void setAllArticles(List<Article> articles) {
    _allArticles.clear();
    _allArticles.addAll(articles);
  }
}
