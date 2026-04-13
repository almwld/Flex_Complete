enum PaymentMethodType {
  card,
  bankAccount,
  wallet,
  cash,
}

class UserPaymentMethod {
  final String id;
  final String userId;
  final String name;
  final PaymentMethodType type;
  final String? cardNumber;
  final String? bankName;
  final String? accountNumber;
  final String? expiryDate;
  final String? cvv;
  final bool isDefault;
  final DateTime? createdAt;

  UserPaymentMethod({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    this.cardNumber,
    this.bankName,
    this.accountNumber,
    this.expiryDate,
    this.cvv,
    this.isDefault = false,
    this.createdAt,
  });

  factory UserPaymentMethod.fromJson(Map<String, dynamic> json) {
    return UserPaymentMethod(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      name: json['name'] ?? '',
      type: PaymentMethodType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PaymentMethodType.card,
      ),
      cardNumber: json['card_number'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      expiryDate: json['expiry_date'],
      cvv: json['cvv'],
      isDefault: json['is_default'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'type': type.name,
      'card_number': cardNumber,
      'bank_name': bankName,
      'account_number': accountNumber,
      'expiry_date': expiryDate,
      'cvv': cvv,
      'is_default': isDefault,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  String get maskedCardNumber {
    if (cardNumber == null || cardNumber!.length < 4) return '';
    return '**** **** **** ${cardNumber!.substring(cardNumber!.length - 4)}';
  }

  UserPaymentMethod copyWith({
    String? id,
    String? userId,
    String? name,
    PaymentMethodType? type,
    String? cardNumber,
    String? bankName,
    String? accountNumber,
    String? expiryDate,
    String? cvv,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return UserPaymentMethod(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      type: type ?? this.type,
      cardNumber: cardNumber ?? this.cardNumber,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
