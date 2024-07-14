import 'package:flutter/foundation.dart';
import 'article_service.dart';

class BookmarkService extends ChangeNotifier {
  final Set<String> _bookmarkedArticleIds = {};
  final List<Article> _allArticles = [];

  bool isBookmarked(String articleId) =>
      _bookmarkedArticleIds.contains(articleId);

  void toggleBookmark(Article article) {
    if (_bookmarkedArticleIds.contains(article.id)) {
      _bookmarkedArticleIds.remove(article.id);
    } else {
      _bookmarkedArticleIds.add(article.id);
    }
    notifyListeners();
  }

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
