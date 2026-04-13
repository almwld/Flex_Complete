/// نموذج محفظة يمن موبايل
class YemenMobileWalletModel {
  final String id;
  final String userId;
  final String phoneNumber;
  final double balance;
  final String status;
  final String network;
  final DateTime createdAt;
  final DateTime updatedAt;

  YemenMobileWalletModel({
    required this.id,
    required this.userId,
    required this.phoneNumber,
    required this.balance,
    required this.status,
    required this.network,
    required this.createdAt,
    required this.updatedAt,
  });

  factory YemenMobileWalletModel.fromJson(Map<String, dynamic> json) {
    return YemenMobileWalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      status: json['status'] ?? 'active',
      network: json['network'] ?? 'Yemen Mobile',
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
      'network': network,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  bool get isActive => status == 'active';
}
