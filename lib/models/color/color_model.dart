import 'package:flutter/material.dart';

/// نموذج اللون
class ColorModel {
  final String id;
  final String name;
  final String nameAr;
  final int colorValue;
  final String? hexCode;
  final int sortOrder;
  final bool isActive;

  ColorModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.colorValue,
    this.hexCode,
    this.sortOrder = 0,
    this.isActive = true,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nameAr: json['name_ar'] ?? '',
      colorValue: json['color_value'] ?? 0xFF000000,
      hexCode: json['hex_code'],
      sortOrder: json['sort_order'] ?? 0,
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_ar': nameAr,
      'color_value': colorValue,
      'hex_code': hexCode,
      'sort_order': sortOrder,
      'is_active': isActive,
    };
  }

  Color get color => Color(colorValue);
}

class ProductColors {
  static const List<ColorModel> colors = [
    ColorModel(id: 'black', name: 'Black', nameAr: 'أسود', colorValue: 0xFF000000, hexCode: '#000000'),
    ColorModel(id: 'white', name: 'White', nameAr: 'أبيض', colorValue: 0xFFFFFFFF, hexCode: '#FFFFFF'),
    ColorModel(id: 'red', name: 'Red', nameAr: 'أحمر', colorValue: 0xFFF44336, hexCode: '#F44336'),
    ColorModel(id: 'blue', name: 'Blue', nameAr: 'أزرق', colorValue: 0xFF2196F3, hexCode: '#2196F3'),
    ColorModel(id: 'green', name: 'Green', nameAr: 'أخضر', colorValue: 0xFF4CAF50, hexCode: '#4CAF50'),
    ColorModel(id: 'yellow', name: 'Yellow', nameAr: 'أصفر', colorValue: 0xFFFFEB3B, hexCode: '#FFEB3B'),
    ColorModel(id: 'orange', name: 'Orange', nameAr: 'برتقالي', colorValue: 0xFFFF9800, hexCode: '#FF9800'),
    ColorModel(id: 'purple', name: 'Purple', nameAr: 'بنفسجي', colorValue: 0xFF9C27B0, hexCode: '#9C27B0'),
    ColorModel(id: 'pink', name: 'Pink', nameAr: 'وردي', colorValue: 0xFFE91E63, hexCode: '#E91E63'),
    ColorModel(id: 'brown', name: 'Brown', nameAr: 'بني', colorValue: 0xFF795548, hexCode: '#795548'),
    ColorModel(id: 'gray', name: 'Gray', nameAr: 'رمادي', colorValue: 0xFF9E9E9E, hexCode: '#9E9E9E'),
    ColorModel(id: 'gold', name: 'Gold', nameAr: 'ذهبي', colorValue: 0xFFFFD700, hexCode: '#FFD700'),
    ColorModel(id: 'silver', name: 'Silver', nameAr: 'فضي', colorValue: 0xFFC0C0C0, hexCode: '#C0C0C0'),
    ColorModel(id: 'navy', name: 'Navy', nameAr: 'كحلي', colorValue: 0xFF001F3F, hexCode: '#001F3F'),
    ColorModel(id: 'beige', name: 'Beige', nameAr: 'بيج', colorValue: 0xFFF5F5DC, hexCode: '#F5F5DC'),
  ];
}
