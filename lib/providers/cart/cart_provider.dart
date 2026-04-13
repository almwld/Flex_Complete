import 'package:flutter/material.dart';

/// مزود السلة
class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  String? _appliedCoupon;
  double _discount = 0;

  List<CartItem> get items => _items;
  String? get appliedCoupon => _appliedCoupon;
  double get discount => _discount;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  double get shipping => subtotal > 500000 ? 0 : 25000;

  double get total => subtotal + shipping - _discount;

  void addItem(CartItem item) {
    final existingIndex = _items.indexWhere(
      (i) => i.productId == item.productId && i.variantId == item.variantId,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String productId, {String? variantId}) {
    _items.removeWhere(
      (item) => item.productId == productId && item.variantId == variantId,
    );
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity, {String? variantId}) {
    final index = _items.indexWhere(
      (i) => i.productId == productId && i.variantId == variantId,
    );
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
      notifyListeners();
    }
  }

  void applyCoupon(String coupon) {
    _appliedCoupon = coupon;
    // حساب الخصم (محاكاة)
    _discount = subtotal * 0.1; // 10% خصم
    notifyListeners();
  }

  void removeCoupon() {
    _appliedCoupon = null;
    _discount = 0;
    notifyListeners();
  }

  void clear() {
    _items.clear();
    _appliedCoupon = null;
    _discount = 0;
    notifyListeners();
  }
}

class CartItem {
  final String productId;
  final String name;
  final String? variantId;
  final String? variantName;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.productId,
    required this.name,
    this.variantId,
    this.variantName,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}
