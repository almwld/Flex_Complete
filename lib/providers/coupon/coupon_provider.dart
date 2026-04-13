import 'package:flutter/material.dart';

/// مزود الكوبونات
class CouponProvider extends ChangeNotifier {
  List<Coupon> _availableCoupons = [];
  Coupon? _appliedCoupon;
  bool _isLoading = false;

  List<Coupon> get availableCoupons => _availableCoupons;
  Coupon? get appliedCoupon => _appliedCoupon;
  bool get isLoading => _isLoading;

  Future<void> loadCoupons() async {
    _isLoading = true;
    notifyListeners();

    // محاكاة تحميل الكوبونات
    await Future.delayed(const Duration(seconds: 1));

    _availableCoupons = [
      Coupon(
        id: '1',
        code: 'FLEX10',
        discountType: DiscountType.percentage,
        discountValue: 10,
        minOrderAmount: 100000,
        maxDiscount: 50000,
        validFrom: DateTime.now().subtract(const Duration(days: 5)),
        validUntil: DateTime.now().add(const Duration(days: 25)),
        usageLimit: 100,
        usedCount: 45,
      ),
      Coupon(
        id: '2',
        code: 'FLEX50',
        discountType: DiscountType.fixed,
        discountValue: 50000,
        minOrderAmount: 200000,
        validFrom: DateTime.now(),
        validUntil: DateTime.now().add(const Duration(days: 30)),
        usageLimit: 50,
        usedCount: 12,
      ),
      Coupon(
        id: '3',
        code: 'FREESHIP',
        discountType: DiscountType.freeShipping,
        minOrderAmount: 150000,
        validFrom: DateTime.now().subtract(const Duration(days: 10)),
        validUntil: DateTime.now().add(const Duration(days: 20)),
        usageLimit: 200,
        usedCount: 89,
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }

  CouponValidationResult validateCoupon(String code, double orderAmount) {
    final coupon = _availableCoupons.firstWhere(
      (c) => c.code == code.toUpperCase(),
      orElse: () => Coupon(
        id: '',
        code: '',
        discountType: DiscountType.percentage,
        discountValue: 0,
        validFrom: DateTime.now(),
        validUntil: DateTime.now(),
      ),
    );

    if (coupon.id.isEmpty) {
      return CouponValidationResult(
        valid: false,
        message: 'كود الكوبون غير صالح',
      );
    }

    if (coupon.validUntil.isBefore(DateTime.now())) {
      return CouponValidationResult(
        valid: false,
        message: 'انتهت صلاحية الكوبون',
      );
    }

    if (coupon.usedCount >= coupon.usageLimit) {
      return CouponValidationResult(
        valid: false,
        message: 'تم استخدام جميع رموز هذا الكوبون',
      );
    }

    if (orderAmount < coupon.minOrderAmount) {
      return CouponValidationResult(
        valid: false,
        message: 'الحد الأدنى للطلب: ${coupon.minOrderAmount.toInt()} ر.ي',
      );
    }

    return CouponValidationResult(
      valid: true,
      coupon: coupon,
      message: 'تم تطبيق الكوبون بنجاح',
    );
  }

  void applyCoupon(Coupon coupon) {
    _appliedCoupon = coupon;
    notifyListeners();
  }

  void removeCoupon() {
    _appliedCoupon = null;
    notifyListeners();
  }

  double calculateDiscount(double orderAmount) {
    if (_appliedCoupon == null) return 0;

    switch (_appliedCoupon!.discountType) {
      case DiscountType.percentage:
        final discount = orderAmount * (_appliedCoupon!.discountValue / 100);
        return discount > (_appliedCoupon!.maxDiscount ?? double.infinity)
            ? (_appliedCoupon!.maxDiscount ?? discount)
            : discount;
      case DiscountType.fixed:
        return _appliedCoupon!.discountValue;
      case DiscountType.freeShipping:
        return 25000; // قيمة الشحن
    }
  }
}

class Coupon {
  final String id;
  final String code;
  final DiscountType discountType;
  final double discountValue;
  final double? minOrderAmount;
  final double? maxDiscount;
  final DateTime validFrom;
  final DateTime validUntil;
  final int usageLimit;
  final int usedCount;

  Coupon({
    required this.id,
    required this.code,
    required this.discountType,
    required this.discountValue,
    this.minOrderAmount,
    this.maxDiscount,
    required this.validFrom,
    required this.validUntil,
    required this.usageLimit,
    required this.usedCount,
  });
}

enum DiscountType {
  percentage,
  fixed,
  freeShipping,
}

class CouponValidationResult {
  final bool valid;
  final Coupon? coupon;
  final String message;

  CouponValidationResult({
    required this.valid,
    this.coupon,
    required this.message,
  });
}
