import 'package:flutter/material.dart';

/// فئة الرياضة
class SportsCategory {
  static const String id = 'sports';
  static const String name = 'الرياضة';
  static const String icon = '⚽';
  static const Color color = Color(0xFF4CAF50);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'fitness', 'name': 'اللياقة البدنية', 'icon': '🏋️'},
    {'id': 'football', 'name': 'كرة القدم', 'icon': '⚽'},
    {'id': 'basketball', 'name': 'كرة السلة', 'icon': '🏀'},
    {'id': 'tennis', 'name': 'التنس', 'icon': '🎾'},
    {'id': 'swimming', 'name': 'السباحة', 'icon': '🏊'},
    {'id': 'cycling', 'name': 'ركوب الدراجات', 'icon': '🚴'},
    {'id': 'camping', 'name': 'التخييم', 'icon': '⛺'},
    {'id': 'outdoor', 'name': 'الأنشطة الخارجية', 'icon': '🏔️'},
  ];
}
