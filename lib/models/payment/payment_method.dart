/// نموذج طريقة الدفع
class PaymentMethodModel {
  final String id;
  final String name;
  final String description;
  final String icon;
  final PaymentMethodType type;
  final bool isEnabled;
  final double? processingFee;
  final Map<String, dynamic>? configuration;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.type,
    this.isEnabled = true,
    this.processingFee,
    this.configuration,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? 'payment',
      type: PaymentMethodType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PaymentMethodType.cash,
      ),
      isEnabled: json['is_enabled'] ?? true,
      processingFee: json['processing_fee']?.toDouble(),
      configuration: json['configuration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'type': type.name,
      'is_enabled': isEnabled,
      'processing_fee': processingFee,
      'configuration': configuration,
    };
  }
}

enum PaymentMethodType {
  cash,
  bankTransfer,
  wallet,
  card,
  applePay,
  googlePay,
}
