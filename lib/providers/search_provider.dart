import 'package:flutter/material.dart';

/// مزود البحث
class SearchProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _recentSearches = [];
  final List<Map<String, dynamic>> _searchResults = [];
  bool _isLoading = false;
  String _query = '';

  List<Map<String, dynamic>> get recentSearches => _recentSearches;
  List<Map<String, dynamic>> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  String get query => _query;

  /// البحث
  Future<void> search(String query) async {
    _query = query;
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    // محاكاة النتائج
    _searchResults.clear();
    if (query.isNotEmpty) {
      _searchResults.addAll([
        {'name': 'آيفون 15 برو', 'category': 'إلكترونيات', 'price': '2500\$'},
        {'name': 'سامسونج S24', 'category': 'إلكترونيات', 'price': '2200\$'},
      ]);
    }

    _isLoading = false;
    notifyListeners();
  }

  /// إضافة بحث حديث
  void addRecentSearch(String query) {
    if (query.isNotEmpty) {
      _recentSearches.remove(query);
      _recentSearches.insert(0, query);
      if (_recentSearches.length > 10) {
        _recentSearches.removeLast();
      }
      notifyListeners();
    }
  }

  /// حذف بحث حديث
  void removeRecentSearch(String query) {
    _recentSearches.remove(query);
    notifyListeners();
  }

  /// مسح البحث
  void clearSearch() {
    _query = '';
    _searchResults.clear();
    notifyListeners();
  }

  /// مسح البحث الحديث
  void clearRecentSearches() {
    _recentSearches.clear();
    notifyListeners();
  }
}
