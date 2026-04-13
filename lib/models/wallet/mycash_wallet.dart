/// نموذج محفظة MyCash
class MyCashWalletModel {
  final String id;
  final String userId;
  final String cardNumber;
  final double balance;
  final String status;
  final DateTime? expiryDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  MyCashWalletModel({
    required this.id,
    required this.userId,
    required this.cardNumber,
    required this.balance,
    required this.status,
    this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyCashWalletModel.fromJson(Map<String, dynamic> json) {
    return MyCashWalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      cardNumber: json['card_number'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      status: json['status'] ?? 'active',
      expiryDate: json['expiry_date'] != null
          ? DateTime.parse(json['expiry_date'])
          : null,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'card_number': cardNumber,
      'balance': balance,
      'status': status,
      'expiry_date': expiryDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool get isActive => status == 'active';

  String get maskedCardNumber {
    if (cardNumber.length < 4) return cardNumber;
    return '****${cardNumber.substring(cardNumber.length - 4)}';
  }
}
