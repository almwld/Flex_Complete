class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String userType;
  final DateTime? createdAt;
  final bool isVerified;
  final String? city;
  final String? address;
  final int? points;
  final String? referralCode;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.avatarUrl,
    this.userType = 'customer',
    this.createdAt,
    this.isVerified = false,
    this.city,
    this.address,
    this.points,
    this.referralCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullName: json['full_name'] ?? json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatarUrl: json['avatar_url'] ?? json['avatar'],
      userType: json['user_type'] ?? 'customer',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      isVerified: json['is_verified'] ?? false,
      city: json['city'],
      address: json['address'],
      points: json['points'],
      referralCode: json['referral_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'user_type': userType,
      'created_at': createdAt?.toIso8601String(),
      'is_verified': isVerified,
      'city': city,
      'address': address,
      'points': points,
      'referral_code': referralCode,
    };
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? avatarUrl,
    String? userType,
    DateTime? createdAt,
    bool? isVerified,
    String? city,
    String? address,
    int? points,
    String? referralCode,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      userType: userType ?? this.userType,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
      city: city ?? this.city,
      address: address ?? this.address,
      points: points ?? this.points,
      referralCode: referralCode ?? this.referralCode,
    );
  }
}
