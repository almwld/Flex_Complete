import 'package:flutter/material.dart';

/// فئة الكتب والتعليم
class BooksCategory {
  static const String id = 'books';
  static const String name = 'الكتب والتعليم';
  static const String icon = '📚';
  static const Color color = Color(0xFF795548);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'fiction', 'name': 'الروايات', 'icon': '📖'},
    {'id': 'nonfiction', 'name': 'غير الروايات', 'icon': '📕'},
    {'id': 'academic', 'name': 'الأكاديمية', 'icon': '🎓'},
    {'id': 'children', 'name': 'كتب الأطفال', 'icon': '📗'},
    {'id': 'languages', 'name': 'اللغات', 'icon': '🌍'},
    {'id': 'business', 'name': 'الأعمال', 'icon': '💼'},
    {'id': 'technology', 'name': 'التكنولوجيا', 'icon': '💻'},
    {'id': 'religion', 'name': 'الدين', 'icon': '📿'},
  ];
}
