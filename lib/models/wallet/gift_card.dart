/// نموذج بطاقة الهدايا
class GiftCardModel {
  final String id;
  final String name;
  final String brand;
  final String imageUrl;
  final double value;
  final double price;
  final String currency;
  final bool isAvailable;
  final DateTime createdAt;

  GiftCardModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.value,
    required this.price,
    required this.currency,
    required this.isAvailable,
    required this.createdAt,
  });

  factory GiftCardModel.fromJson(Map<String, dynamic> json) {
    return GiftCardModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      imageUrl: json['image_url'] ?? '',
      value: (json['value'] ?? 0).toDouble(),
      price: (json['price'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'USD',
      isAvailable: json['is_available'] ?? true,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'image_url': imageUrl,
      'value': value,
      'price': price,
      'currency': currency,
      'is_available': isAvailable,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

/// بطاقات الهدايا المتاحة
class GiftCardBrand {
  static const List<String> brands = [
    'Amazon',
    'Google Play',
    'App Store',
    'Steam',
    'Netflix',
    'Spotify',
    'iTunes',
    'PlayStation',
    'Xbox',
    'Disney+',
    'YouTube Premium',
    'Adobe',
  ];
}
