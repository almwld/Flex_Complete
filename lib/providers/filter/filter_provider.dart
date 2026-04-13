import 'package:flutter/material.dart';

/// مزود الفلاتر
class FilterProvider extends ChangeNotifier {
  // الفلاتر المختارة
  List<String> _selectedCategories = [];
  List<String> _selectedBrands = [];
  double _minPrice = 0;
  double _maxPrice = 1000000;
  bool _inStockOnly = false;
  bool _onSaleOnly = false;
  String _sortBy = 'relevance';

  // Getters
  List<String> get selectedCategories => _selectedCategories;
  List<String> get selectedBrands => _selectedBrands;
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  bool get inStockOnly => _inStockOnly;
  bool get onSaleOnly => _onSaleOnly;
  String get sortBy => _sortBy;

  bool get hasActiveFilters =>
      _selectedCategories.isNotEmpty ||
      _selectedBrands.isNotEmpty ||
      _minPrice > 0 ||
      _maxPrice < 1000000 ||
      _inStockOnly ||
      _onSaleOnly;

  int get activeFilterCount {
    int count = 0;
    if (_selectedCategories.isNotEmpty) count++;
    if (_selectedBrands.isNotEmpty) count++;
    if (_minPrice > 0 || _maxPrice < 1000000) count++;
    if (_inStockOnly) count++;
    if (_onSaleOnly) count++;
    return count;
  }

  // Actions
  void toggleCategory(String category) {
    if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      _selectedCategories.add(category);
    }
    notifyListeners();
  }

  void toggleBrand(String brand) {
    if (_selectedBrands.contains(brand)) {
      _selectedBrands.remove(brand);
    } else {
      _selectedBrands.add(brand);
    }
    notifyListeners();
  }

  void setPriceRange(double min, double max) {
    _minPrice = min;
    _maxPrice = max;
    notifyListeners();
  }

  void setInStockOnly(bool value) {
    _inStockOnly = value;
    notifyListeners();
  }

  void setOnSaleOnly(bool value) {
    _onSaleOnly = value;
    notifyListeners();
  }

  void setSortBy(String sort) {
    _sortBy = sort;
    notifyListeners();
  }

  void applyFilters({
    List<String>? categories,
    List<String>? brands,
    double? minPrice,
    double? maxPrice,
    bool? inStockOnly,
    bool? onSaleOnly,
  }) {
    if (categories != null) _selectedCategories = categories;
    if (brands != null) _selectedBrands = brands;
    if (minPrice != null) _minPrice = minPrice;
    if (maxPrice != null) _maxPrice = maxPrice;
    if (inStockOnly != null) _inStockOnly = inStockOnly;
    if (onSaleOnly != null) _onSaleOnly = onSaleOnly;
    notifyListeners();
  }

  void resetFilters() {
    _selectedCategories.clear();
    _selectedBrands.clear();
    _minPrice = 0;
    _maxPrice = 1000000;
    _inStockOnly = false;
    _onSaleOnly = false;
    _sortBy = 'relevance';
    notifyListeners();
  }

  Map<String, dynamic> toQueryParameters() {
    return {
      if (_selectedCategories.isNotEmpty)
        'categories': _selectedCategories.join(','),
      if (_selectedBrands.isNotEmpty) 'brands': _selectedBrands.join(','),
      'min_price': _minPrice.toInt(),
      'max_price': _maxPrice.toInt(),
      if (_inStockOnly) 'in_stock': '1',
      if (_onSaleOnly) 'on_sale': '1',
      'sort': _sortBy,
    };
  }
}
