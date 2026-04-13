class AppConstants {
  // API
  static const String baseUrl = 'https://api.flexyemen.com';
  static const String apiVersion = 'v1';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';
  static const String viewModeKey = 'view_mode';
  static const String onboardingKey = 'onboarding_complete';

  // Currencies
  static const String yemeniRial = 'ر.ي';
  static const String usDollar = '\$';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);

  // Validation
  static const int minPasswordLength = 8;
  static const int maxNameLength = 100;
  static const int maxPhoneLength = 15;
  static const int minPhoneLength = 9;

  // Yemen Cities
  static const List<String> yemenCities = [
    'صنعاء',
    'عدن',
    'تعز',
    'الحديدة',
    'إب',
    'تعز',
    'البيضاء',
    'ذمار',
    'حجة',
    'عمران',
    'صعدة',
    'المكلا',
    'سيئون',
    'زبيد',
    'ابين',
  ];

  // Market Categories
  static const List<String> marketCategories = [
    'الأسواق اليمنية',
    'المولات',
    'المقاهي',
    'الاستراحات',
    'الفنادق',
    'المطاعم',
    'الإلكترونيات',
    'السيارات',
    'العقارات',
    'الأزياء',
  ];

  // Product Categories (25 main categories)
  static const List<Map<String, dynamic>> productCategories = [
    {'name': 'إلكترونيات', 'icon': 'devices'},
    {'name': 'ملابس رجالي', 'icon': 'checkroom'},
    {'name': 'ملابس نسائي', 'icon': 'checkroom'},
    {'name': 'أطفال', 'icon': 'child_care'},
    {'name': 'أحذية', 'icon': 'hiking'},
    {'name': 'مجوهرات', 'icon': 'diamond'},
    {'name': 'عطور', 'icon': 'perfume'},
    {'name': 'مكياج', 'icon': 'makeup'},
    {'name': 'حقائب', 'icon': 'backpack'},
    {'name': 'ساعات', 'icon': 'watch'},
    {'name': 'نظارات', 'icon': 'glasses'},
    {'name': 'أثاث', 'icon': 'chair'},
    {'name': 'ديكور', 'icon': 'home'},
    {'name': 'مطبخ', 'icon': 'kitchen'},
    {'name': 'رياضة', 'icon': 'sports'},
    {'name': 'كتب', 'icon': 'book'},
    {'name': 'ألعاب', 'icon': 'games'},
    {'name': 'سيارات', 'icon': 'directions_car'},
    {'name': 'عقارات', 'icon': 'apartment'},
    {'name': 'موبايلات', 'icon': 'phone_android'},
    {'name': 'كمبيوتر', 'icon': 'computer'},
    {'name': 'كاميرات', 'icon': 'photo_camera'},
    {'name': 'صحة', 'icon': 'health'},
    {'name': 'جمال', 'icon': 'spa'},
    {'name': 'أخرى', 'icon': 'category'},
  ];

  // View Modes
  static const String viewModeLite = 'lite';
  static const String viewModePro = 'pro';
  static const String viewModeExpert = 'expert';
}
