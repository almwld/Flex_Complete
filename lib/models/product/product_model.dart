class ProductModel {
  final String id;
  final String title;
  final String name;           // لإظهار اسم المنتج (مرادف لـ title)
  final String description;
  final double price;
  final double? originalPrice;
  final double? oldPrice;
  final List<String> images;
  final String category;
  final String? subcategory;
  final String city;
  final String sellerId;
  final String sellerName;
  final String? marketName;    // اسم المتجر
  final double? rating;
  final int? reviewCount;
  final int? reviews;
  final DateTime createdAt;
  final bool isFeatured;
  final bool isNew;
  final bool isAuction;
  final bool isFavorite;       // للمفضلة
  final DateTime? auctionEndTime;
  final double? currentBid;
  final int stock;
  final bool inStock;
  final int? discount;
  final Map<String, String>? specifications;

  // Getters للتنسيق
  String get formattedPrice => '${price.toStringAsFixed(0)} ر.ي';
  String get formattedOldPrice => oldPrice != null ? '${oldPrice!.toStringAsFixed(0)} ر.ي' : '';

  ProductModel({
    required this.id,
    required this.title,
    this.name = '',
    this.description = '',
    required this.price,
    this.originalPrice,
    this.oldPrice,
    required this.images,
    required this.category,
    this.subcategory,
    this.city = 'صنعاء',
    this.sellerId = '',
    this.sellerName = '',
    this.marketName,
    this.rating,
    this.reviewCount,
    this.reviews,
    DateTime? createdAt,
    this.isFeatured = false,
    this.isNew = false,
    this.isAuction = false,
    this.isFavorite = false,
    this.auctionEndTime,
    this.currentBid,
    this.stock = 0,
    this.inStock = true,
    this.discount,
    this.specifications,
  }) : createdAt = createdAt ?? DateTime.now();

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      name: json['name'] ?? json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      originalPrice: json['original_price']?.toDouble(),
      oldPrice: json['old_price']?.toDouble(),
      images: List<String>.from(json['images'] ?? []),
      category: json['category'] ?? '',
      subcategory: json['subcategory'],
      city: json['city'] ?? '',
      sellerId: json['seller_id'] ?? '',
      sellerName: json['seller_name'] ?? '',
      marketName: json['market_name'] ?? json['seller_name'],
      rating: json['rating']?.toDouble(),
      reviewCount: json['review_count'],
      reviews: json['reviews'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      isFeatured: json['is_featured'] ?? false,
      isNew: json['is_new'] ?? false,
      isAuction: json['is_auction'] ?? false,
      isFavorite: json['is_favorite'] ?? false,
      auctionEndTime: json['auction_end_time'] != null ? DateTime.parse(json['auction_end_time']) : null,
      currentBid: json['current_bid']?.toDouble(),
      stock: json['stock'] ?? 0,
      inStock: json['in_stock'] ?? true,
      discount: json['discount'],
      specifications: json['specifications'] != null ? Map<String, String>.from(json['specifications']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'name': name,
      'description': description,
      'price': price,
      'original_price': originalPrice,
      'old_price': oldPrice,
      'images': images,
      'category': category,
      'subcategory': subcategory,
      'city': city,
      'seller_id': sellerId,
      'seller_name': sellerName,
      'market_name': marketName,
      'rating': rating,
      'review_count': reviewCount,
      'reviews': reviews,
      'created_at': createdAt.toIso8601String(),
      'is_featured': isFeatured,
      'is_new': isNew,
      'is_auction': isAuction,
      'is_favorite': isFavorite,
      'auction_end_time': auctionEndTime?.toIso8601String(),
      'current_bid': currentBid,
      'stock': stock,
      'in_stock': inStock,
      'discount': discount,
      'specifications': specifications,
    };
  }

  double? get discountPercentage {
    if (oldPrice == null || oldPrice! <= price) return null;
    return ((oldPrice! - price) / oldPrice! * 100);
  }
}
