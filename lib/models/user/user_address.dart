class UserAddress {
  final String id;
  final String userId;
  final String label;
  final String city;
  final String area;
  final String street;
  final String building;
  final String floor;
  final String? apartment;
  final String phone;
  final bool isDefault;
  final String? instructions;

  UserAddress({
    required this.id,
    required this.userId,
    required this.label,
    required this.city,
    required this.area,
    required this.street,
    required this.building,
    this.floor = '',
    this.apartment,
    required this.phone,
    this.isDefault = false,
    this.instructions,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      label: json['label'] ?? 'منزل',
      city: json['city'] ?? '',
      area: json['area'] ?? '',
      street: json['street'] ?? '',
      building: json['building'] ?? '',
      floor: json['floor'] ?? '',
      apartment: json['apartment'],
      phone: json['phone'] ?? '',
      isDefault: json['is_default'] ?? false,
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'label': label,
      'city': city,
      'area': area,
      'street': street,
      'building': building,
      'floor': floor,
      'apartment': apartment,
      'phone': phone,
      'is_default': isDefault,
      'instructions': instructions,
    };
  }

  String get fullAddress => '$label - $city, $area, $street';

  UserAddress copyWith({
    String? id,
    String? userId,
    String? label,
    String? city,
    String? area,
    String? street,
    String? building,
    String? floor,
    String? apartment,
    String? phone,
    bool? isDefault,
    String? instructions,
  }) {
    return UserAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      city: city ?? this.city,
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      apartment: apartment ?? this.apartment,
      phone: phone ?? this.phone,
      isDefault: isDefault ?? this.isDefault,
      instructions: instructions ?? this.instructions,
    );
  }
}
