class MarketModel {
  final String id;
  final String name;
  final String description;
  final String type;
  final String city;
  final String address;
  final double lat;
  final double lng;
  final String? imageUrl;
  final String? coverImage;
  final double rating;
  final int reviewCount;
  final int productCount;
  final int vendorCount;
  final bool isOpen;
  final String openingHours;
  final String? phone;
  final String? website;
  final List<String> features;
  final DateTime createdAt;

  MarketModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.city,
    required this.address,
    required this.lat,
    required this.lng,
    this.imageUrl,
    this.coverImage,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.productCount = 0,
    this.vendorCount = 0,
    this.isOpen = true,
    this.openingHours = '08:00 - 22:00',
    this.phone,
    this.website,
    this.features = const [],
    required this.createdAt,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      city: json['city'] ?? '',
      address: json['address'] ?? '',
      lat: (json['lat'] ?? 0).toDouble(),
      lng: (json['lng'] ?? 0).toDouble(),
      imageUrl: json['image_url'],
      coverImage: json['cover_image'],
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      productCount: json['product_count'] ?? 0,
      vendorCount: json['vendor_count'] ?? 0,
      isOpen: json['is_open'] ?? true,
      openingHours: json['opening_hours'] ?? '08:00 - 22:00',
      phone: json['phone'],
      website: json['website'],
      features: List<String>.from(json['features'] ?? []),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'city': city,
      'address': address,
      'lat': lat,
      'lng': lng,
      'image_url': imageUrl,
      'cover_image': coverImage,
      'rating': rating,
      'review_count': reviewCount,
      'product_count': productCount,
      'vendor_count': vendorCount,
      'is_open': isOpen,
      'opening_hours': openingHours,
      'phone': phone,
      'website': website,
      'features': features,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

// Market Types
class MarketType {
  static const String yemeniMarkets = 'الأسواق اليمنية';
  static const String malls = 'المولات';
  static const String cafes = 'المقاهي';
  static const String resthouses = 'الاستراحات';
  static const String hotels = 'الفنادق';
  static const String restaurants = 'المطاعم';
  static const String electronics = 'الإلكترونيات';
  static const String cars = 'السيارات';
  static const String realEstate = 'العقارات';
  static const String fashion = 'الأزياء';

  static const List<String> allTypes = [
    yemeniMarkets,
    malls,
    cafes,
    resthouses,
    hotels,
    restaurants,
    electronics,
    cars,
    realEstate,
    fashion,
  ];
}
