class ProductModel {
  final String id;
  final String title;
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
  final double? rating;
  final int? reviewCount;
  final int? reviews;
  final DateTime createdAt;
  final bool isFeatured;
  final bool isNew;
  final bool isAuction;
  final DateTime? auctionEndTime;
  final double? currentBid;
  final int stock;
  final bool inStock;
  final int? discount;
  final Map<String, String>? specifications;

  ProductModel({
    required this.id,
    required this.title,
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
    this.rating,
    this.reviewCount,
    this.reviews,
    DateTime? createdAt,
    this.isFeatured = false,
    this.isNew = false,
    this.isAuction = false,
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
      rating: json['rating']?.toDouble(),
      reviewCount: json['review_count'],
      reviews: json['reviews'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      isFeatured: json['is_featured'] ?? false,
      isNew: json['is_new'] ?? false,
      isAuction: json['is_auction'] ?? false,
      auctionEndTime: json['auction_end_time'] != null
          ? DateTime.parse(json['auction_end_time'])
          : null,
      currentBid: json['current_bid']?.toDouble(),
      stock: json['stock'] ?? 0,
      inStock: json['in_stock'] ?? true,
      discount: json['discount'],
      specifications: json['specifications'] != null
          ? Map<String, String>.from(json['specifications'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
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
      'rating': rating,
      'review_count': reviewCount,
      'reviews': reviews,
      'created_at': createdAt.toIso8601String(),
      'is_featured': isFeatured,
      'is_new': isNew,
      'is_auction': isAuction,
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

  ProductModel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? originalPrice,
    double? oldPrice,
    List<String>? images,
    String? category,
    String? subcategory,
    String? city,
    String? sellerId,
    String? sellerName,
    double? rating,
    int? reviewCount,
    int? reviews,
    DateTime? createdAt,
    bool? isFeatured,
    bool? isNew,
    bool? isAuction,
    DateTime? auctionEndTime,
    double? currentBid,
    int? stock,
    bool? inStock,
    int? discount,
    Map<String, String>? specifications,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      oldPrice: oldPrice ?? this.oldPrice,
      images: images ?? this.images,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      city: city ?? this.city,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      reviews: reviews ?? this.reviews,
      createdAt: createdAt ?? this.createdAt,
      isFeatured: isFeatured ?? this.isFeatured,
      isNew: isNew ?? this.isNew,
      isAuction: isAuction ?? this.isAuction,
      auctionEndTime: auctionEndTime ?? this.auctionEndTime,
      currentBid: currentBid ?? this.currentBid,
      stock: stock ?? this.stock,
      inStock: inStock ?? this.inStock,
      discount: discount ?? this.discount,
      specifications: specifications ?? this.specifications,
    );
  }
}