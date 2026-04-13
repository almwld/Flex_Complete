/// نموذج رسوم التوصيل
class DeliveryFee {
  final String id;
  final String? regionId;
  final String? cityId;
  final String regionName;
  final String cityName;
  final DeliveryType deliveryType;
  final double baseFee;
  final double perKgFee;
  final double minWeight;
  final double maxWeight;
  final int estimatedDaysMin;
  final int estimatedDaysMax;
  final bool isActive;
  final DateTime? validFrom;
  final DateTime? validUntil;

  DeliveryFee({
    required this.id,
    this.regionId,
    this.cityId,
    required this.regionName,
    required this.cityName,
    required this.deliveryType,
    required this.baseFee,
    this.perKgFee = 0,
    this.minWeight = 0,
    this.maxWeight = 100,
    this.estimatedDaysMin = 1,
    this.estimatedDaysMax = 5,
    this.isActive = true,
    this.validFrom,
    this.validUntil,
  });

  factory DeliveryFee.fromJson(Map<String, dynamic> json) {
    return DeliveryFee(
      id: json['id'] ?? '',
      regionId: json['region_id'],
      cityId: json['city_id'],
      regionName: json['region_name'] ?? '',
      cityName: json['city_name'] ?? '',
      deliveryType: DeliveryType.values.firstWhere(
        (e) => e.name == json['delivery_type'],
        orElse: () => DeliveryType.standard,
      ),
      baseFee: (json['base_fee'] ?? 0).toDouble(),
      perKgFee: (json['per_kg_fee'] ?? 0).toDouble(),
      minWeight: (json['min_weight'] ?? 0).toDouble(),
      maxWeight: (json['max_weight'] ?? 100).toDouble(),
      estimatedDaysMin: json['estimated_days_min'] ?? 1,
      estimatedDaysMax: json['estimated_days_max'] ?? 5,
      isActive: json['is_active'] ?? true,
      validFrom: json['valid_from'] != null ? DateTime.parse(json['valid_from']) : null,
      validUntil: json['valid_until'] != null ? DateTime.parse(json['valid_until']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'region_id': regionId,
      'city_id': cityId,
      'region_name': regionName,
      'city_name': cityName,
      'delivery_type': deliveryType.name,
      'base_fee': baseFee,
      'per_kg_fee': perKgFee,
      'min_weight': minWeight,
      'max_weight': maxWeight,
      'estimated_days_min': estimatedDaysMin,
      'estimated_days_max': estimatedDaysMax,
      'is_active': isActive,
      'valid_from': validFrom?.toIso8601String(),
      'valid_until': validUntil?.toIso8601String(),
    };
  }

  double calculateFee(double weight) {
    if (weight < minWeight) return baseFee;
    if (weight > maxWeight) return baseFee + (perKgFee * maxWeight);
    return baseFee + (perKgFee * weight);
  }

  String get estimatedDelivery {
    if (estimatedDaysMin == estimatedDaysMax) {
      return '$estimatedDaysMin يوم';
    }
    return '$estimatedDaysMin - $estimatedDaysMax أيام';
  }
}

enum DeliveryType {
  standard,
  express,
  sameDay,
  scheduled,
  pickup,
}
