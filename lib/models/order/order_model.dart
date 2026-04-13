class OrderModel {
  final String id;
  final String orderNumber;
  final String userId;
  final String sellerId;
  final List<OrderItem> items;
  final double subtotal;
  final double shipping;
  final double tax;
  final double discount;
  final double total;
  final String status;
  final String? couponCode;
  final OrderAddress shippingAddress;
  final OrderAddress billingAddress;
  final String? couponId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deliveredAt;
  final String? trackingNumber;
  final String? notes;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.userId,
    required this.sellerId,
    required this.items,
    required this.subtotal,
    this.shipping = 0,
    this.tax = 0,
    this.discount = 0,
    required this.total,
    this.status = 'pending',
    this.couponCode,
    required this.shippingAddress,
    required this.billingAddress,
    this.couponId,
    required this.createdAt,
    this.updatedAt,
    this.deliveredAt,
    this.trackingNumber,
    this.notes,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      orderNumber: json['order_number'] ?? '',
      userId: json['user_id'] ?? '',
      sellerId: json['seller_id'] ?? '',
      items: (json['items'] as List? ?? [])
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      subtotal: (json['subtotal'] ?? 0).toDouble(),
      shipping: (json['shipping'] ?? 0).toDouble(),
      tax: (json['tax'] ?? 0).toDouble(),
      discount: (json['discount'] ?? 0).toDouble(),
      total: (json['total'] ?? 0).toDouble(),
      status: json['status'] ?? 'pending',
      couponCode: json['coupon_code'],
      shippingAddress: OrderAddress.fromJson(json['shipping_address'] ?? {}),
      billingAddress: OrderAddress.fromJson(json['billing_address'] ?? {}),
      couponId: json['coupon_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      deliveredAt: json['delivered_at'] != null
          ? DateTime.parse(json['delivered_at'])
          : null,
      trackingNumber: json['tracking_number'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': orderNumber,
      'user_id': userId,
      'seller_id': sellerId,
      'items': items.map((e) => e.toJson()).toList(),
      'subtotal': subtotal,
      'shipping': shipping,
      'tax': tax,
      'discount': discount,
      'total': total,
      'status': status,
      'coupon_code': couponCode,
      'shipping_address': shippingAddress.toJson(),
      'billing_address': billingAddress.toJson(),
      'coupon_id': couponId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'delivered_at': deliveredAt?.toIso8601String(),
      'tracking_number': trackingNumber,
      'notes': notes,
    };
  }
}

class OrderItem {
  final String id;
  final String productId;
  final String productName;
  final String? productImage;
  final double price;
  final int quantity;
  final double? discount;
  final String? variant;
  final Map<String, String>? options;

  OrderItem({
    required this.id,
    required this.productId,
    required this.productName,
    this.productImage,
    required this.price,
    required this.quantity,
    this.discount,
    this.variant,
    this.options,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] ?? '',
      productId: json['product_id'] ?? '',
      productName: json['product_name'] ?? '',
      productImage: json['product_image'],
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 1,
      discount: json['discount']?.toDouble(),
      variant: json['variant'],
      options: json['options'] != null
          ? Map<String, String>.from(json['options'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'price': price,
      'quantity': quantity,
      'discount': discount,
      'variant': variant,
      'options': options,
    };
  }

  double get total => (price * quantity) - (discount ?? 0);
}

class OrderAddress {
  final String name;
  final String phone;
  final String city;
  final String area;
  final String street;
  final String building;
  final String? floor;
  final String? apartment;
  final String? instructions;

  OrderAddress({
    required this.name,
    required this.phone,
    required this.city,
    required this.area,
    required this.street,
    required this.building,
    this.floor,
    this.apartment,
    this.instructions,
  });

  factory OrderAddress.fromJson(Map<String, dynamic> json) {
    return OrderAddress(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      city: json['city'] ?? '',
      area: json['area'] ?? '',
      street: json['street'] ?? '',
      building: json['building'] ?? '',
      floor: json['floor'],
      apartment: json['apartment'],
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'city': city,
      'area': area,
      'street': street,
      'building': building,
      'floor': floor,
      'apartment': apartment,
      'instructions': instructions,
    };
  }

  String get fullAddress => '$city, $area, $street';
}
