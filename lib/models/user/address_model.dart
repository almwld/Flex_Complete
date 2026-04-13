/// نموذج العنوان
class AddressModel {
  final String id;
  final String userId;
  final String label;
  final String fullName;
  final String phone;
  final String phonePrefix;
  final String city;
  final String area;
  final String street;
  final String building;
  final String? floor;
  final String? apartment;
  final String? additionalDirections;
  final double latitude;
  final double longitude;
  final bool isDefault;
  final DateTime createdAt;

  AddressModel({
    required this.id,
    required this.userId,
    required this.label,
    required this.fullName,
    required this.phone,
    this.phonePrefix = '+967',
    required this.city,
    required this.area,
    required this.street,
    required this.building,
    this.floor,
    this.apartment,
    this.additionalDirections,
    this.latitude = 0,
    this.longitude = 0,
    this.isDefault = false,
    required this.createdAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      label: json['label'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'] ?? '',
      phonePrefix: json['phone_prefix'] ?? '+967',
      city: json['city'] ?? '',
      area: json['area'] ?? '',
      street: json['street'] ?? '',
      building: json['building'] ?? '',
      floor: json['floor'],
      apartment: json['apartment'],
      additionalDirections: json['additional_directions'],
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      isDefault: json['is_default'] ?? false,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'label': label,
      'full_name': fullName,
      'phone': phone,
      'phone_prefix': phonePrefix,
      'city': city,
      'area': area,
      'street': street,
      'building': building,
      'floor': floor,
      'apartment': apartment,
      'additional_directions': additionalDirections,
      'latitude': latitude,
      'longitude': longitude,
      'is_default': isDefault,
      'created_at': createdAt.toIso8601String(),
    };
  }

  String get fullAddress {
    final parts = <String>[];
    if (building.isNotEmpty) parts.add('مبنى $building');
    if (floor != null && floor!.isNotEmpty) parts.add('طابق $floor');
    if (apartment != null && apartment!.isNotEmpty) parts.add('شقة $apartment');
    if (street.isNotEmpty) parts.add('شارع $street');
    if (area.isNotEmpty) parts.add('$area');
    if (city.isNotEmpty) parts.add(city);
    return parts.join(', ');
  }

  String get formattedPhone => '$phonePrefix$phone';

  AddressModel copyWith({
    String? id,
    String? userId,
    String? label,
    String? fullName,
    String? phone,
    String? phonePrefix,
    String? city,
    String? area,
    String? street,
    String? building,
    String? floor,
    String? apartment,
    String? additionalDirections,
    double? latitude,
    double? longitude,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return AddressModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      label: label ?? this.label,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      phonePrefix: phonePrefix ?? this.phonePrefix,
      city: city ?? this.city,
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      floor: floor ?? this.floor,
      apartment: apartment ?? this.apartment,
      additionalDirections: additionalDirections ?? this.additionalDirections,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
