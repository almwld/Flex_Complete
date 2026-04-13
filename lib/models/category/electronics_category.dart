import 'package:flutter/material.dart';

/// فئة الإلكترونيات
class ElectronicsCategory {
  static const String id = 'electronics';
  static const String name = 'الإلكترونيات';
  static const String icon = '📱';
  static const Color color = Color(0xFF1E88E5);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'phones', 'name': 'الهواتف', 'icon': '📱'},
    {'id': 'tablets', 'name': 'الأجهزة اللوحية', 'icon': '📲'},
    {'id': 'laptops', 'name': 'اللابتوبات', 'icon': '💻'},
    {'id': 'desktops', 'name': 'أجهزة سطح المكتب', 'icon': '🖥️'},
    {'id': 'accessories', 'name': 'الإكسسوارات', 'icon': '🎧'},
    {'id': 'cameras', 'name': 'الكاميرات', 'icon': '📷'},
    {'id': 'smartwatches', 'name': 'الساعات الذكية', 'icon': '⌚'},
    {'id': 'gaming', 'name': 'الألعاب', 'icon': '🎮'},
  ];
}
