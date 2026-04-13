enum CardType {
  visa,
  mastercard,
  amex,
  other,
}

class WalletCard {
  final String id;
  final String walletId;
  final String cardNumber;
  final String holderName;
  final String expiryMonth;
  final String expiryYear;
  final CardType type;
  final bool isDefault;
  final DateTime createdAt;

  WalletCard({
    required this.id,
    required this.walletId,
    required this.cardNumber,
    required this.holderName,
    required this.expiryMonth,
    required this.expiryYear,
    this.type = CardType.other,
    this.isDefault = false,
    required this.createdAt,
  });

  factory WalletCard.fromJson(Map<String, dynamic> json) {
    return WalletCard(
      id: json['id'] ?? '',
      walletId: json['wallet_id'] ?? '',
      cardNumber: json['card_number'] ?? '',
      holderName: json['holder_name'] ?? '',
      expiryMonth: json['expiry_month'] ?? '',
      expiryYear: json['expiry_year'] ?? '',
      type: CardType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => CardType.other,
      ),
      isDefault: json['is_default'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'card_number': cardNumber,
      'holder_name': holderName,
      'expiry_month': expiryMonth,
      'expiry_year': expiryYear,
      'type': type.name,
      'is_default': isDefault,
      'created_at': createdAt.toIso8601String(),
    };
  }

  String get maskedNumber {
    if (cardNumber.length < 4) return '';
    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  String get expiryDate => '$expiryMonth/$expiryYear';

  String get typeName {
    switch (type) {
      case CardType.visa:
        return 'Visa';
      case CardType.mastercard:
        return 'Mastercard';
      case CardType.amex:
        return 'American Express';
      default:
        return 'بطاقة';
    }
  }

  WalletCard copyWith({
    String? id,
    String? walletId,
    String? cardNumber,
    String? holderName,
    String? expiryMonth,
    String? expiryYear,
    CardType? type,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return WalletCard(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      cardNumber: cardNumber ?? this.cardNumber,
      holderName: holderName ?? this.holderName,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      type: type ?? this.type,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
