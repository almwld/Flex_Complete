enum BillType {
  electricity,
  water,
  internet,
  phone,
  gas,
  municipality,
}

enum BillStatus {
  pending,
  paid,
  overdue,
  cancelled,
}

class BillModel {
  final String id;
  final String userId;
  final BillType type;
  final String accountNumber;
  final String? subscriberName;
  final double amount;
  final double? previousBalance;
  final double? penalty;
  final String? period;
  final BillStatus status;
  final String? dueDate;
  final DateTime createdAt;
  final DateTime? paidAt;
  final String? transactionId;

  BillModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.accountNumber,
    this.subscriberName,
    required this.amount,
    this.previousBalance,
    this.penalty,
    this.period,
    this.status = BillStatus.pending,
    this.dueDate,
    required this.createdAt,
    this.paidAt,
    this.transactionId,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      type: BillType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => BillType.electricity,
      ),
      accountNumber: json['account_number'] ?? '',
      subscriberName: json['subscriber_name'],
      amount: (json['amount'] ?? 0).toDouble(),
      previousBalance: json['previous_balance']?.toDouble(),
      penalty: json['penalty']?.toDouble(),
      period: json['period'],
      status: BillStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => BillStatus.pending,
      ),
      dueDate: json['due_date'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      paidAt: json['paid_at'] != null
          ? DateTime.parse(json['paid_at'])
          : null,
      transactionId: json['transaction_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type.name,
      'account_number': accountNumber,
      'subscriber_name': subscriberName,
      'amount': amount,
      'previous_balance': previousBalance,
      'penalty': penalty,
      'period': period,
      'status': status.name,
      'due_date': dueDate,
      'created_at': createdAt.toIso8601String(),
      'paid_at': paidAt?.toIso8601String(),
      'transaction_id': transactionId,
    };
  }

  String get typeName {
    switch (type) {
      case BillType.electricity:
        return 'الكهرباء';
      case BillType.water:
        return 'المياه';
      case BillType.internet:
        return 'الإنترنت';
      case BillType.phone:
        return 'الهاتف';
      case BillType.gas:
        return 'الغاز';
      case BillType.municipality:
        return 'البلدية';
    }
  }

  String get typeIcon {
    switch (type) {
      case BillType.electricity:
        return 'bolt';
      case BillType.water:
        return 'water_drop';
      case BillType.internet:
        return 'wifi';
      case BillType.phone:
        return 'phone';
      case BillType.gas:
        return 'local_fire_department';
      case BillType.municipality:
        return 'location_city';
    }
  }
}
