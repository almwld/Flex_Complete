import 'package:flutter/material.dart';

/// فئة الألعاب والدمى
class ToysCategory {
  static const String id = 'toys';
  static const String name = 'الألعاب والدمى';
  static const String icon = '🧸';
  static const Color color = Color(0xFFF44336);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'action', 'name': 'ألعاب الحركة', 'icon': '🦸'},
    {'id': 'building', 'name': 'ألعاب البناء', 'icon': '🧱'},
    {'id': 'educational', 'name': 'ألعاب تعليمية', 'icon': '🧩'},
    {'id': 'dolls', 'name': 'الدمى', 'icon': '👶'},
    {'id': 'vehicles', 'name': 'المركبات', 'icon': '🚗'},
    {'id': 'outdoor', 'name': 'ألعاب خارجية', 'icon': '🎡'},
    {'id': 'board', 'name': 'ألعاب الطاولة', 'icon': '🎲'},
    {'id': 'electronic', 'name': 'ألعاب إلكترونية', 'icon': '🕹️'},
  ];
}
