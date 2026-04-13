/// نموذج محفظة TelY (تيل واي)
class TelYWalletModel {
  final String id;
  final String userId;
  final String phoneNumber;
  final double balance;
  final String status;
  final double dataBalance;
  final DateTime createdAt;
  final DateTime updatedAt;

  TelYWalletModel({
    required this.id,
    required this.userId,
    required this.phoneNumber,
    required this.balance,
    required this.status,
    required this.dataBalance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TelYWalletModel.fromJson(Map<String, dynamic> json) {
    return TelYWalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      status: json['status'] ?? 'active',
      dataBalance: (json['data_balance'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'phone_number': phoneNumber,
      'balance': balance,
      'status': status,
      'data_balance': dataBalance,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool get isActive => status == 'active';
}
