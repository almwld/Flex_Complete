/// نموذج محفظة YPay
class YPayWalletModel {
  final String id;
  final String userId;
  final String accountNumber;
  final double balance;
  final String status;
  final double dailyLimit;
  final double monthlyLimit;
  final DateTime createdAt;
  final DateTime updatedAt;

  YPayWalletModel({
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.balance,
    required this.status,
    required this.dailyLimit,
    required this.monthlyLimit,
    required this.createdAt,
    required this.updatedAt,
  });

  factory YPayWalletModel.fromJson(Map<String, dynamic> json) {
    return YPayWalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      accountNumber: json['account_number'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      status: json['status'] ?? 'active',
      dailyLimit: (json['daily_limit'] ?? 500000).toDouble(),
      monthlyLimit: (json['monthly_limit'] ?? 5000000).toDouble(),
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'account_number': accountNumber,
      'balance': balance,
      'status': status,
      'daily_limit': dailyLimit,
      'monthly_limit': monthlyLimit,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool get isActive => status == 'active';
}
