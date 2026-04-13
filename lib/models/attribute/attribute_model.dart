/// نموذج السمة
class AttributeModel {
  final String id;
  final String name;
  final String nameAr;
  final AttributeType type;
  final bool isRequired;
  final bool isFilterable;
  final bool isSearchable;
  final List<String>? options;
  final String? unit;
  final int sortOrder;

  AttributeModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.type,
    this.isRequired = false,
    this.isFilterable = false,
    this.isSearchable = false,
    this.options,
    this.unit,
    this.sortOrder = 0,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) {
    return AttributeModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nameAr: json['name_ar'] ?? '',
      type: AttributeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => AttributeType.text,
      ),
      isRequired: json['is_required'] ?? false,
      isFilterable: json['is_filterable'] ?? false,
      isSearchable: json['is_searchable'] ?? false,
      options: json['options'] != null ? List<String>.from(json['options']) : null,
      unit: json['unit'],
      sortOrder: json['sort_order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_ar': nameAr,
      'type': type.name,
      'is_required': isRequired,
      'is_filterable': isFilterable,
      'is_searchable': isSearchable,
      'options': options,
      'unit': unit,
      'sort_order': sortOrder,
    };
  }
}

enum AttributeType {
  text,
  number,
  boolean,
  select,
  multiselect,
  color,
  size,
}
