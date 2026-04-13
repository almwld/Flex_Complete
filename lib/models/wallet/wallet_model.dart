class WalletModel {
  final String id;
  final String userId;
  final double balanceYER;
  final double balanceUSD;
  final double pendingBalance;
  final DateTime? lastTransactionAt;
  final bool isActive;
  final String? vipTier;

  WalletModel({
    required this.id,
    required this.userId,
    this.balanceYER = 0.0,
    this.balanceUSD = 0.0,
    this.pendingBalance = 0.0,
    this.lastTransactionAt,
    this.isActive = true,
    this.vipTier,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      balanceYER: (json['balance_yer'] ?? 0).toDouble(),
      balanceUSD: (json['balance_usd'] ?? 0).toDouble(),
      pendingBalance: (json['pending_balance'] ?? 0).toDouble(),
      lastTransactionAt: json['last_transaction_at'] != null
          ? DateTime.parse(json['last_transaction_at'])
          : null,
      isActive: json['is_active'] ?? true,
      vipTier: json['vip_tier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'balance_yer': balanceYER,
      'balance_usd': balanceUSD,
      'pending_balance': pendingBalance,
      'last_transaction_at': lastTransactionAt?.toIso8601String(),
      'is_active': isActive,
      'vip_tier': vipTier,
    };
  }

  double get totalBalanceYER => balanceYER + pendingBalance;

  WalletModel copyWith({
    String? id,
    String? userId,
    double? balanceYER,
    double? balanceUSD,
    double? pendingBalance,
    DateTime? lastTransactionAt,
    bool? isActive,
    String? vipTier,
  }) {
    return WalletModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      balanceYER: balanceYER ?? this.balanceYER,
      balanceUSD: balanceUSD ?? this.balanceUSD,
      pendingBalance: pendingBalance ?? this.pendingBalance,
      lastTransactionAt: lastTransactionAt ?? this.lastTransactionAt,
      isActive: isActive ?? this.isActive,
      vipTier: vipTier ?? this.vipTier,
    );
  }
}
