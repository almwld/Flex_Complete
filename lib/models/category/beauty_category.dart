import 'package:flutter/material.dart';

/// فئة الجمال والعناية
class BeautyCategory {
  static const String id = 'beauty';
  static const String name = 'الجمال والعناية';
  static const String icon = '💄';
  static const Color color = Color(0xFF9C27B0);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'skincare', 'name': 'العناية بالبشرة', 'icon': '🧴'},
    {'id': 'makeup', 'name': 'المكياج', 'icon': '💄'},
    {'id': 'haircare', 'name': 'العناية بالشعر', 'icon': '💇'},
    {'id': 'perfumes', 'name': 'العطور', 'icon': '🌸'},
    {'id': 'tools', 'name': 'أدوات التجميل', 'icon': '💅'},
    {'id': ' supplements', 'name': 'المكملات', 'icon': '💊'},
  ];
}
