/// خدمة QR
class QrService {
  static final QrService _instance = QrService._internal();
  factory QrService() => _instance;
  QrService._internal();

  // إنشاء رمز QR للدفع
  String generatePaymentQr({
    required String merchantId,
    required double amount,
    required String orderId,
    String? description,
  }) {
    final data = {
      'type': 'payment',
      'merchant': merchantId,
      'amount': amount,
      'order': orderId,
      'description': description,
      'timestamp': DateTime.now().toIso8601String(),
    };
    return _encodeQrData(data);
  }

  // إنشاء رمز QR للتحويل
  String generateTransferQr({
    required String walletId,
    required String recipientId,
    double? amount,
  }) {
    final data = {
      'type': 'transfer',
      'from': walletId,
      'to': recipientId,
      'amount': amount,
      'timestamp': DateTime.now().toIso8601String(),
    };
    return _encodeQrData(data);
  }

  // إنشاء رمز QR للملف الشخصي
  String generateProfileQr(String userId) {
    final data = {
      'type': 'profile',
      'user': userId,
    };
    return _encodeQrData(data);
  }

  // إنشاء رمز QR للمنتج
  String generateProductQr(String productId) {
    final data = {
      'type': 'product',
      'product': productId,
    };
    return _encodeQrData(data);
  }

  // تحليل رمز QR
  Map<String, dynamic>? parseQrCode(String qrData) {
    try {
      // محاكاة فك تشفير QR
      if (qrData.startsWith('flex:')) {
        final jsonStr = qrData.substring(4);
        // return jsonDecode(jsonStr);
        return {'type': 'payment', 'data': jsonStr};
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  String _encodeQrData(Map<String, dynamic> data) {
    // محاكاة إنشاء QR
    return 'flex:${data.toString()}';
  }
}
