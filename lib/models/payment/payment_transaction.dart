/// نموذج معاملة الدفع
class PaymentTransaction {
  final String id;
  final String orderId;
  final String userId;
  final PaymentTransactionType type;
  final double amount;
  final double fee;
  final double netAmount;
  final PaymentStatus status;
  final String paymentMethod;
  final String? transactionRef;
  final String? gatewayResponse;
  final DateTime createdAt;
  final DateTime? completedAt;
  final String? failureReason;

  PaymentTransaction({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.type,
    required this.amount,
    required this.fee,
    required this.netAmount,
    required this.status,
    required this.paymentMethod,
    this.transactionRef,
    this.gatewayResponse,
    required this.createdAt,
    this.completedAt,
    this.failureReason,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentTransaction(
      id: json['id'] ?? '',
      orderId: json['order_id'] ?? '',
      userId: json['user_id'] ?? '',
      type: PaymentTransactionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PaymentTransactionType.charge,
      ),
      amount: (json['amount'] ?? 0).toDouble(),
      fee: (json['fee'] ?? 0).toDouble(),
      netAmount: (json['net_amount'] ?? 0).toDouble(),
      status: PaymentStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => PaymentStatus.pending,
      ),
      paymentMethod: json['payment_method'] ?? '',
      transactionRef: json['transaction_ref'],
      gatewayResponse: json['gateway_response'],
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at']) : null,
      failureReason: json['failure_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'user_id': userId,
      'type': type.name,
      'amount': amount,
      'fee': fee,
      'net_amount': netAmount,
      'status': status.name,
      'payment_method': paymentMethod,
      'transaction_ref': transactionRef,
      'gateway_response': gatewayResponse,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'failure_reason': failureReason,
    };
  }
}

enum PaymentTransactionType {
  charge,
  refund,
  withdrawal,
  transfer,
}

enum PaymentStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
  refunded,
}
