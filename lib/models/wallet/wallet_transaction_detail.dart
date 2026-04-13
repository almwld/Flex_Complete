/// نموذج تفاصيل معاملة المحفظة
class WalletTransactionDetail {
  final String id;
  final String transactionId;
  final String walletId;
  final TransactionDetailType type;
  final double amount;
  final double balanceBefore;
  final double balanceAfter;
  final String? relatedUserId;
  final String? relatedUserName;
  final String? relatedTransactionId;
  final String? description;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;

  WalletTransactionDetail({
    required this.id,
    required this.transactionId,
    required this.walletId,
    required this.type,
    required this.amount,
    required this.balanceBefore,
    required this.balanceAfter,
    this.relatedUserId,
    this.relatedUserName,
    this.relatedTransactionId,
    this.description,
    this.metadata,
    required this.createdAt,
  });

  factory WalletTransactionDetail.fromJson(Map<String, dynamic> json) {
    return WalletTransactionDetail(
      id: json['id'] ?? '',
      transactionId: json['transaction_id'] ?? '',
      walletId: json['wallet_id'] ?? '',
      type: TransactionDetailType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => TransactionDetailType.deposit,
      ),
      amount: (json['amount'] ?? 0).toDouble(),
      balanceBefore: (json['balance_before'] ?? 0).toDouble(),
      balanceAfter: (json['balance_after'] ?? 0).toDouble(),
      relatedUserId: json['related_user_id'],
      relatedUserName: json['related_user_name'],
      relatedTransactionId: json['related_transaction_id'],
      description: json['description'],
      metadata: json['metadata'],
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transaction_id': transactionId,
      'wallet_id': walletId,
      'type': type.name,
      'amount': amount,
      'balance_before': balanceBefore,
      'balance_after': balanceAfter,
      'related_user_id': relatedUserId,
      'related_user_name': relatedUserName,
      'related_transaction_id': relatedTransactionId,
      'description': description,
      'metadata': metadata,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

enum TransactionDetailType {
  deposit,
  withdrawal,
  transfer,
  receive,
  payment,
  refund,
  charge,
  commission,
  bonus,
}
