class BankAccount {
  final String id;
  final String walletId;
  final String bankName;
  final String accountNumber;
  final String? iban;
  final String? accountHolder;
  final String? branch;
  final bool isDefault;
  final DateTime createdAt;

  BankAccount({
    required this.id,
    required this.walletId,
    required this.bankName,
    required this.accountNumber,
    this.iban,
    this.accountHolder,
    this.branch,
    this.isDefault = false,
    required this.createdAt,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      id: json['id'] ?? '',
      walletId: json['wallet_id'] ?? '',
      bankName: json['bank_name'] ?? '',
      accountNumber: json['account_number'] ?? '',
      iban: json['iban'],
      accountHolder: json['account_holder'],
      branch: json['branch'],
      isDefault: json['is_default'] ?? false,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'bank_name': bankName,
      'account_number': accountNumber,
      'iban': iban,
      'account_holder': accountHolder,
      'branch': branch,
      'is_default': isDefault,
      'created_at': createdAt.toIso8601String(),
    };
  }

  String get maskedAccountNumber {
    if (accountNumber.length < 4) return '';
    return '****${accountNumber.substring(accountNumber.length - 4)}';
  }

  BankAccount copyWith({
    String? id,
    String? walletId,
    String? bankName,
    String? accountNumber,
    String? iban,
    String? accountHolder,
    String? branch,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return BankAccount(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      iban: iban ?? this.iban,
      accountHolder: accountHolder ?? this.accountHolder,
      branch: branch ?? this.branch,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

// Yemen Banks
class YemenBank {
  final String id;
  final String name;
  final String logoUrl;
  final String? website;
  final String? phone;

  const YemenBank({
    required this.id,
    required this.name,
    this.logoUrl = '',
    this.website,
    this.phone,
  });

  static const List<YemenBank> yemenBanks = [
    YemenBank(id: '1', name: 'البنك المركزي اليمني'),
    YemenBank(id: '2', name: 'البنك الأهلي اليمني'),
    YemenBank(id: '3', name: 'بنك كريستي'),
    YemenBank(id: '4', name: 'بنك اليمن الدولي'),
    YemenBank(id: '5', name: 'بنك سبأ الإسلامي'),
    YemenBank(id: '6', name: 'بنك التضامن'),
    YemenBank(id: '7', name: 'البنك العربي'),
    YemenBank(id: '8', name: 'بنك القاهرة范冰冰'),
  ];
}
