class UserSettings {
  final String userId;
  final bool notificationsEnabled;
  final bool emailNotifications;
  final bool smsNotifications;
  final bool pushNotifications;
  final String language;
  final String currency;
  final bool darkMode;
  final bool biometricEnabled;
  final String? pinCode;

  UserSettings({
    required this.userId,
    this.notificationsEnabled = true,
    this.emailNotifications = true,
    this.smsNotifications = true,
    this.pushNotifications = true,
    this.language = 'ar',
    this.currency = 'YER',
    this.darkMode = false,
    this.biometricEnabled = false,
    this.pinCode,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      userId: json['user_id'] ?? '',
      notificationsEnabled: json['notifications_enabled'] ?? true,
      emailNotifications: json['email_notifications'] ?? true,
      smsNotifications: json['sms_notifications'] ?? true,
      pushNotifications: json['push_notifications'] ?? true,
      language: json['language'] ?? 'ar',
      currency: json['currency'] ?? 'YER',
      darkMode: json['dark_mode'] ?? false,
      biometricEnabled: json['biometric_enabled'] ?? false,
      pinCode: json['pin_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'notifications_enabled': notificationsEnabled,
      'email_notifications': emailNotifications,
      'sms_notifications': smsNotifications,
      'push_notifications': pushNotifications,
      'language': language,
      'currency': currency,
      'dark_mode': darkMode,
      'biometric_enabled': biometricEnabled,
      'pin_code': pinCode,
    };
  }

  UserSettings copyWith({
    String? userId,
    bool? notificationsEnabled,
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    String? language,
    String? currency,
    bool? darkMode,
    bool? biometricEnabled,
    String? pinCode,
  }) {
    return UserSettings(
      userId: userId ?? this.userId,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      smsNotifications: smsNotifications ?? this.smsNotifications,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      language: language ?? this.language,
      currency: currency ?? this.currency,
      darkMode: darkMode ?? this.darkMode,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      pinCode: pinCode ?? this.pinCode,
    );
  }
}
