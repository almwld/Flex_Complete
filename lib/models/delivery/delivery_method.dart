/// نموذج طريقة التوصيل
class DeliveryMethod {
  final String id;
  final String name;
  final String description;
  final String icon;
  final double basePrice;
  final double? freeShippingThreshold;
  final int estimatedDaysMin;
  final int estimatedDaysMax;
  final bool isAvailable;
  final List<String> availableCities;

  DeliveryMethod({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.basePrice,
    this.freeShippingThreshold,
    required this.estimatedDaysMin,
    required this.estimatedDaysMax,
    this.isAvailable = true,
    this.availableCities = const [],
  });

  factory DeliveryMethod.fromJson(Map<String, dynamic> json) {
    return DeliveryMethod(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? 'local_shipping',
      basePrice: (json['base_price'] ?? 0).toDouble(),
      freeShippingThreshold: json['free_shipping_threshold']?.toDouble(),
      estimatedDaysMin: json['estimated_days_min'] ?? 1,
      estimatedDaysMax: json['estimated_days_max'] ?? 3,
      isAvailable: json['is_available'] ?? true,
      availableCities: List<String>.from(json['available_cities'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'base_price': basePrice,
      'free_shipping_threshold': freeShippingThreshold,
      'estimated_days_min': estimatedDaysMin,
      'estimated_days_max': estimatedDaysMax,
      'is_available': isAvailable,
      'available_cities': availableCities,
    };
  }

  double calculatePrice(double orderAmount) {
    if (freeShippingThreshold != null && orderAmount >= freeShippingThreshold!) {
      return 0;
    }
    return basePrice;
  }

  String get estimatedDelivery {
    if (estimatedDaysMin == estimatedDaysMax) {
      return '$estimatedDaysMin يوم';
    }
    return '$estimatedDaysMin - $estimatedDaysMax أيام';
  }
}
