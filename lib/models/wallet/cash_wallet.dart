import 'wallet_model.dart';

/// نموذج محفظة كاش (Cash Wallet)
class CashWalletModel {
  final String id;
  final String userId;
  final double balance;
  final String currency;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> branches;
  final bool isActive;

  CashWalletModel({
    required this.id,
    required this.userId,
    required this.balance,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
    required this.branches,
    required this.isActive,
  });

  factory CashWalletModel.fromJson(Map<String, dynamic> json) {
    return CashWalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      currency: json['currency'] ?? 'YER',
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
      branches: List<String>.from(json['branches'] ?? []),
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'balance': balance,
      'currency': currency,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'branches': branches,
      'is_active': isActive,
    };
  }

  CashWalletModel copyWith({
    String? id,
    String? userId,
    double? balance,
    String? currency,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? branches,
    bool? isActive,
  }) {
    return CashWalletModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      branches: branches ?? this.branches,
      isActive: isActive ?? this.isActive,
    );
  }
}

/// نموذج فرع السحب النقدي
class CashBranch {
  final String id;
  final String name;
  final String address;
  final String city;
  final String phone;
  final double latitude;
  final double longitude;
  final String workingHours;
  final bool isOpen;

  CashBranch({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.latitude,
    required this.longitude,
    required this.workingHours,
    required this.isOpen,
  });

  factory CashBranch.fromJson(Map<String, dynamic> json) {
    return CashBranch(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      phone: json['phone'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      workingHours: json['working_hours'] ?? '9:00 - 18:00',
      isOpen: json['is_open'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'phone': phone,
      'latitude': latitude,
      'longitude': longitude,
      'working_hours': workingHours,
      'is_open': isOpen,
    };
  }
}
