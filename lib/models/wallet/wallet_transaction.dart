enum TransactionType {
  deposit,
  withdraw,
  transfer,
  receive,
  payment,
  recharge,
  bill,
  refund,
  commission,
}

enum TransactionStatus {
  pending,
  completed,
  failed,
  cancelled,
  refunded,
}

class WalletTransaction {
  final String id;
  final String walletId;
  final String type;
  final double amount;
  final String currency;
  final double? fee;
  final String? recipientId;
  final String? recipientName;
  final String? senderId;
  final String? senderName;
  final String? reference;
  final String? description;
  final String status;
  final DateTime createdAt;
  final DateTime? completedAt;
  final Map<String, dynamic>? metadata;

  WalletTransaction({
    required this.id,
    required this.walletId,
    required this.type,
    required this.amount,
    this.currency = 'YER',
    this.fee,
    this.recipientId,
    this.recipientName,
    this.senderId,
    this.senderName,
    this.reference,
    this.description,
    this.status = 'pending',
    required this.createdAt,
    this.completedAt,
    this.metadata,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      id: json['id'] ?? '',
      walletId: json['wallet_id'] ?? '',
      type: json['type'] ?? 'transfer',
      amount: (json['amount'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'YER',
      fee: json['fee']?.toDouble(),
      recipientId: json['recipient_id'],
      recipientName: json['recipient_name'],
      senderId: json['sender_id'],
      senderName: json['sender_name'],
      reference: json['reference'],
      description: json['description'],
      status: json['status'] ?? 'pending',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'])
          : null,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'type': type,
      'amount': amount,
      'currency': currency,
      'fee': fee,
      'recipient_id': recipientId,
      'recipient_name': recipientName,
      'sender_id': senderId,
      'sender_name': senderName,
      'reference': reference,
      'description': description,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'metadata': metadata,
    };
  }

  bool get isIncoming =>
      type == 'receive' || type == 'deposit' || type == 'refund';

  bool get isOutgoing =>
      type == 'withdraw' || type == 'transfer' || type == 'payment' || type == 'recharge' || type == 'bill';

  TransactionStatus get statusEnum {
    switch (status) {
      case 'completed':
        return TransactionStatus.completed;
      case 'failed':
        return TransactionStatus.failed;
      case 'cancelled':
        return TransactionStatus.cancelled;
      case 'refunded':
        return TransactionStatus.refunded;
      default:
        return TransactionStatus.pending;
    }
  }

  WalletTransaction copyWith({
    String? id,
    String? walletId,
    String? type,
    double? amount,
    String? currency,
    double? fee,
    String? recipientId,
    String? recipientName,
    String? senderId,
    String? senderName,
    String? reference,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? completedAt,
    Map<String, dynamic>? metadata,
  }) {
    return WalletTransaction(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      fee: fee ?? this.fee,
      recipientId: recipientId ?? this.recipientId,
      recipientName: recipientName ?? this.recipientName,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      reference: reference ?? this.reference,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      metadata: metadata ?? this.metadata,
    );
  }
}
