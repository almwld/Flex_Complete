/// نموذج المخزون
class StockModel {
  final String id;
  final String productId;
  final String? variantId;
  final String warehouseId;
  final int quantity;
  final int reservedQuantity;
  final int availableQuantity;
  final int lowStockThreshold;
  final DateTime lastUpdated;

  StockModel({
    required this.id,
    required this.productId,
    this.variantId,
    required this.warehouseId,
    required this.quantity,
    this.reservedQuantity = 0,
    this.availableQuantity = 0,
    this.lowStockThreshold = 10,
    required this.lastUpdated,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'] ?? '',
      productId: json['product_id'] ?? '',
      variantId: json['variant_id'],
      warehouseId: json['warehouse_id'] ?? '',
      quantity: json['quantity'] ?? 0,
      reservedQuantity: json['reserved_quantity'] ?? 0,
      availableQuantity: json['available_quantity'] ?? 0,
      lowStockThreshold: json['low_stock_threshold'] ?? 10,
      lastUpdated: DateTime.parse(json['last_updated'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'variant_id': variantId,
      'warehouse_id': warehouseId,
      'quantity': quantity,
      'reserved_quantity': reservedQuantity,
      'available_quantity': availableQuantity,
      'low_stock_threshold': lowStockThreshold,
      'last_updated': lastUpdated.toIso8601String(),
    };
  }

  bool get isLowStock => availableQuantity <= lowStockThreshold;
  bool get isOutOfStock => availableQuantity == 0;
  bool get isInStock => availableQuantity > 0;
}
