/// نموذج محفظة FlexPay
class FlexPayWalletModel {
  final String id;
  final String userId;
  final String accountId;
  final double balance;
  final String status;
  final double dailyLimit;
  final double monthlyLimit;
  final List<String> linkedAccounts;
  final DateTime createdAt;
  final DateTime updatedAt;

  FlexPayWalletModel({
    required this.id,
    required this.userId,
    required this.accountId,
    required this.balance,
    required this.status,
    required this.dailyLimit,
    required this.monthlyLimit,
    required this.linkedAccounts,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FlexPayWalletModel.fromJson(Map<String, dynamic> json) {
    return FlexPayWalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      accountId: json['account_id'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      status: json['status'] ?? 'active',
      dailyLimit: (json['daily_limit'] ?? 1000000).toDouble(),
      monthlyLimit: (json['monthly_limit'] ?? 10000000).toDouble(),
      linkedAccounts: List<String>.from(json['linked_accounts'] ?? []),
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'account_id': accountId,
      'balance': balance,
      'status': status,
      'daily_limit': dailyLimit,
      'monthly_limit': monthlyLimit,
      'linked_accounts': linkedAccounts,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool get isActive => status == 'active';
}
