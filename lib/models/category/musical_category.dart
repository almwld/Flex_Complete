import 'package:flutter/material.dart';

/// فئة الأدوات الموسيقية
class MusicalCategory {
  static const String id = 'musical';
  static const String name = 'الأدوات الموسيقية';
  static const String icon = '🎵';
  static const Color color = Color(0xFF673AB7);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'guitars', 'name': 'الجيتارات', 'icon': '🎸'},
    {'id': 'pianos', 'name': 'البيانو', 'icon': '🎹'},
    {'id': 'drums', 'name': 'الطبول', 'icon': '🥁'},
    {'id': 'violins', 'name': 'الكمان', 'icon': '🎻'},
    {'id': 'wind', 'name': 'آلات نفخ', 'icon': '🎺'},
    {'id': 'accessories', 'name': 'إكسسوارات', 'icon': '🎤'},
    {'id': 'recording', 'name': 'تسجيل', 'icon': '🎚️'},
    {'id': 'speakers', 'name': 'سماعات', 'icon': '🔊'},
  ];
}
