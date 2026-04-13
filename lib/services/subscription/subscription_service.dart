/// خدمة الاشتراكات
class SubscriptionService {
  static final SubscriptionService _instance = SubscriptionService._internal();
  factory SubscriptionService() => _instance;
  SubscriptionService._internal();

  // الخطط المتاحة
  final List<SubscriptionPlan> _plans = [
    SubscriptionPlan(
      id: 'lite_monthly',
      name: 'Lite',
      description: 'الخطة الأساسية',
      price: 9.99,
      currency: 'USD',
      interval: SubscriptionInterval.monthly,
      features: [
        'الوصول للسوق الأساسية',
        '5 طلبات شهرياً',
        'دعم عبر البريد',
      ],
    ),
    SubscriptionPlan(
      id: 'pro_monthly',
      name: 'PRO',
      description: 'الخطة الاحترافية',
      price: 19.99,
      currency: 'USD',
      interval: SubscriptionInterval.monthly,
      features: [
        'الوصول لجميع الأسواق',
        '50 طلب شهرياً',
        'دعم أولوي',
        'تقارير متقدمة',
      ],
      isPopular: true,
    ),
    SubscriptionPlan(
      id: 'expert_monthly',
      name: 'Expert',
      description: 'الخطة الخبراء',
      price: 49.99,
      currency: 'USD',
      interval: SubscriptionInterval.monthly,
      features: [
        'كل ميزات PRO',
        'طلبات غير محدودة',
        'دعم 24/7',
        'API وصول',
        'تقارير مخصصة',
      ],
    ),
  ];

  // الحصول على الخطط
  List<SubscriptionPlan> get plans => _plans;

  // التحقق من الاشتراك النشط
  Future<SubscriptionStatus> getSubscriptionStatus() async {
    // محاكاة التحقق
    await Future.delayed(const Duration(milliseconds: 500));
    return SubscriptionStatus(
      isActive: true,
      planId: 'pro_monthly',
      expiresAt: DateTime.now().add(const Duration(days: 30)),
    );
  }

  // بدء فترة تجريبية
  Future<bool> startTrial(String planId) async {
    print('Starting trial for $planId');
    return true;
  }

  // الاشتراك في خطة
  Future<bool> subscribe(String planId) async {
    print('Subscribing to $planId');
    return true;
  }

  // إلغاء الاشتراك
  Future<bool> cancelSubscription() async {
    print('Cancelling subscription');
    return true;
  }

  // تجديد الاشتراك
  Future<bool> renewSubscription() async {
    print('Renewing subscription');
    return true;
  }
}

class SubscriptionPlan {
  final String id;
  final String name;
  final String description;
  final double price;
  final String currency;
  final SubscriptionInterval interval;
  final List<String> features;
  final bool isPopular;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.interval,
    required this.features,
    this.isPopular = false,
  });
}

enum SubscriptionInterval {
  weekly,
  monthly,
  yearly,
}

class SubscriptionStatus {
  final bool isActive;
  final String? planId;
  final DateTime? expiresAt;
  final DateTime? trialEndsAt;

  SubscriptionStatus({
    required this.isActive,
    this.planId,
    this.expiresAt,
    this.trialEndsAt,
  });
}
