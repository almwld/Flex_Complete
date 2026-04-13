import 'package:flutter/material.dart';

/// فئة الصحة
class HealthCategory {
  static const String id = 'health';
  static const String name = 'الصحة';
  static const String icon = '💊';
  static const Color color = Color(0xFFE91E63);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'medicines', 'name': 'الأدوية', 'icon': '💊'},
    {'id': 'supplements', 'name': 'المكملات الغذائية', 'icon': '💪'},
    {'id': 'vitamins', 'name': 'الفيتامينات', 'icon': '🌟'},
    {'id': 'medical', 'name': 'المعدات الطبية', 'icon': '🏥'},
    {'id': 'firstaid', 'name': 'الإسعافات الأولية', 'icon': '🩹'},
    {'id': 'personal', 'name': 'العناية الشخصية', 'icon': '🧼'},
    {'id': 'wellness', 'name': 'الصحة العامة', 'icon': '🌿'},
    {'id': 'sports', 'name': 'الصحة الرياضية', 'icon': '🏃'},
  ];
}
