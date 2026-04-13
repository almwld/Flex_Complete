import 'package:flutter/material.dart';

/// فئة اللوازم المكتبية
class OfficeCategory {
  static const String id = 'office';
  static const String name = 'اللوازم المكتبية';
  static const String icon = '📎';
  static const Color color = Color(0xFF00BCD4);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'stationery', 'name': 'قرطاسية', 'icon': '📝'},
    {'id': 'paper', 'name': 'ورق', 'icon': '📄'},
    {'id': 'printers', 'name': 'طابعات', 'icon': '🖨️'},
    {'id': 'furniture', 'name': 'أثاث مكتبي', 'icon': '🪑'},
    {'id': 'organization', 'name': 'تنظيم', 'icon': '📁'},
    {'id': 'supplies', 'name': 'مستلزمات', 'icon': '📦'},
  ];
}
