/// نموذج المقاس
class SizeModel {
  final String id;
  final String name;
  final String code;
  final SizeType type;
  final int sortOrder;
  final bool isActive;

  SizeModel({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    this.sortOrder = 0,
    this.isActive = true,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      type: SizeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => SizeType.clothing,
      ),
      sortOrder: json['sort_order'] ?? 0,
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'type': type.name,
      'sort_order': sortOrder,
      'is_active': isActive,
    };
  }
}

enum SizeType {
  clothing,
  shoes,
  ring,
  pants,
}

class ClothingSize {
  static const List<SizeModel> sizes = [
    SizeModel(id: 'xs', name: 'XS', code: 'XS', type: SizeType.clothing, sortOrder: 0),
    SizeModel(id: 's', name: 'S', code: 'S', type: SizeType.clothing, sortOrder: 1),
    SizeModel(id: 'm', name: 'M', code: 'M', type: SizeType.clothing, sortOrder: 2),
    SizeModel(id: 'l', name: 'L', code: 'L', type: SizeType.clothing, sortOrder: 3),
    SizeModel(id: 'xl', name: 'XL', code: 'XL', type: SizeType.clothing, sortOrder: 4),
    SizeModel(id: 'xxl', name: 'XXL', code: 'XXL', type: SizeType.clothing, sortOrder: 5),
  ];
}

class ShoeSize {
  static const List<SizeModel> sizes = [
    SizeModel(id: '36', name: '36', code: '36', type: SizeType.shoes, sortOrder: 0),
    SizeModel(id: '37', name: '37', code: '37', type: SizeType.shoes, sortOrder: 1),
    SizeModel(id: '38', name: '38', code: '38', type: SizeType.shoes, sortOrder: 2),
    SizeModel(id: '39', name: '39', code: '39', type: SizeType.shoes, sortOrder: 3),
    SizeModel(id: '40', name: '40', code: '40', type: SizeType.shoes, sortOrder: 4),
    SizeModel(id: '41', name: '41', code: '41', type: SizeType.shoes, sortOrder: 5),
    SizeModel(id: '42', name: '42', code: '42', type: SizeType.shoes, sortOrder: 6),
    SizeModel(id: '43', name: '43', code: '43', type: SizeType.shoes, sortOrder: 7),
  ];
}
