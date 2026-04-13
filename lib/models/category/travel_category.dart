import 'package:flutter/material.dart';

/// فئة السفر
class TravelCategory {
  static const String id = 'travel';
  static const String name = 'السفر';
  static const String icon = '✈️';
  static const Color color = Color(0xFF03A9F4);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'flights', 'name': 'رحلات جوية', 'icon': '✈️'},
    {'id': 'hotels', 'name': 'فنادق', 'icon': '🏨'},
    {'id': 'packages', 'name': 'باقات سياحية', 'icon': '🎒'},
    {'id': 'visas', 'name': 'تأشيرات', 'icon': '📋'},
    {'id': 'insurance', 'name': 'التأمين', 'icon': '🛡️'},
    {'id': 'luggage', 'name': 'الأمتعة', 'icon': '🧳'},
    {'id': 'accessories', 'name': 'إكسسوارات السفر', 'icon': '🗺️'},
  ];
}
