/// خدمة الدفع
class PaymentService {
  static final PaymentService _instance = PaymentService._internal();
  factory PaymentService() => _instance;
  PaymentService._internal();

  // معالجة الدفع
  Future<PaymentResult> processPayment({
    required double amount,
    required String paymentMethod,
    required String orderId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // محاكاة الاتصال بخادم الدفع
      await Future.delayed(const Duration(seconds: 2));

      return PaymentResult(
        success: true,
        transactionId: 'TXN-${DateTime.now().millisecondsSinceEpoch}',
        message: 'تم الدفع بنجاح',
      );
    } catch (e) {
      return PaymentResult(
        success: false,
        message: 'فشلت عملية الدفع: $e',
      );
    }
  }

  // التحقق من حالة الدفع
  Future<PaymentStatus> checkPaymentStatus(String transactionId) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return PaymentStatus.completed;
    } catch (e) {
      return PaymentStatus.failed;
    }
  }

  // استرداد المبلغ
  Future<RefundResult> processRefund({
    required String transactionId,
    required double amount,
    String? reason,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return RefundResult(
        success: true,
        refundId: 'REF-${DateTime.now().millisecondsSinceEpoch}',
        message: 'تم استرداد المبلغ بنجاح',
      );
    } catch (e) {
      return RefundResult(
        success: false,
        message: 'فشل استرداد المبلغ: $e',
      );
    }
  }

  // الحصول على طرق الدفع المتاحة
  Future<List<PaymentMethod>> getAvailablePaymentMethods() async {
    return [
      PaymentMethod(
        id: 'cod',
        name: 'الدفع عند الاستلام',
        icon: 'money',
        type: PaymentMethodType.cash,
      ),
      PaymentMethod(
        id: 'card',
        name: 'بطاقة ائتمان',
        icon: 'credit_card',
        type: PaymentMethodType.card,
      ),
      PaymentMethod(
        id: 'wallet',
        name: 'المحفظة',
        icon: 'wallet',
        type: PaymentMethodType.wallet,
      ),
      PaymentMethod(
        id: 'bank',
        name: 'تحويل بنكي',
        icon: 'account_balance',
        type: PaymentMethodType.bankTransfer,
      ),
    ];
  }
}

class PaymentResult {
  final bool success;
  final String? transactionId;
  final String message;

  PaymentResult({
    required this.success,
    this.transactionId,
    required this.message,
  });
}

class RefundResult {
  final bool success;
  final String? refundId;
  final String message;

  RefundResult({
    required this.success,
    this.refundId,
    required this.message,
  });
}

enum PaymentStatus {
  pending,
  processing,
  completed,
  failed,
  refunded,
}

class PaymentMethod {
  final String id;
  final String name;
  final String icon;
  final PaymentMethodType type;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
  });
}

enum PaymentMethodType {
  cash,
  card,
  wallet,
  bankTransfer,
}
