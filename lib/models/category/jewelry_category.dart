import 'package:flutter/material.dart';

/// فئة المجوهرات
class JewelryCategory {
  static const String id = 'jewelry';
  static const String name = 'المجوهرات';
  static const String icon = '💍';
  static const Color color = Color(0xFFFFD700);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'rings', 'name': 'خواتم', 'icon': '💍'},
    {'id': 'necklaces', 'name': 'عقود', 'icon': '📿'},
    {'id': 'earrings', 'name': 'أقراط', 'icon': '✨'},
    {'id': 'bracelets', 'name': 'أساور', 'icon': '⌚'},
    {'id': 'watches', 'name': 'ساعات', 'icon': '⏱️'},
    {'id': 'gold', 'name': 'ذهب', 'icon': '🏆'},
    {'id': 'silver', 'name': 'فضة', 'icon': '🌙'},
    {'id': 'gems', 'name': 'أحجار كريمة', 'icon': '💎'},
  ];
}
