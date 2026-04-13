import 'package:flutter/material.dart';

/// فئة البقالة
class GroceryCategory {
  static const String id = 'grocery';
  static const String name = 'البقالة';
  static const String icon = '🛒';
  static const Color color = Color(0xFF8BC34A);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'fresh', 'name': 'منتجات طازجة', 'icon': '🥬'},
    {'id': 'dairy', 'name': 'الألبان', 'icon': '🥛'},
    {'id': 'snacks', 'name': 'المشروبات والوجبات الخفيفة', 'icon': '🍿'},
    {'id': 'organic', 'name': 'عضوي', 'icon': '🌿'},
    {'id': 'beverages', 'name': 'المشروبات', 'icon': '🧃'},
    {'id': 'canned', 'name': 'معلبات', 'icon': '🥫'},
    {'id': 'spices', 'name': 'التوابل والبهارات', 'icon': '🧂'},
    {'id': 'coffee', 'name': 'القهوة والشاي', 'icon': '☕'},
  ];
}
