/// خدمة Crashlytics
class CrashlyticsService {
  static final CrashlyticsService _instance = CrashlyticsService._internal();
  factory CrashlyticsService() => _instance;
  CrashlyticsService._internal();

  // إعداد Crashlytics
  Future<void> initialize() async {
    print('Crashlytics initialized');
  }

  // تسجيل خطأ
  Future<void> logError(dynamic error, [StackTrace? stackTrace]) async {
    print('Crashlytics Error: $error');
    if (stackTrace != null) {
      print('StackTrace: $stackTrace');
    }
  }

  // تسجيل رسالة
  Future<void> log(String message) async {
    print('Crashlytics Log: $message');
  }

  // تعيين معرف المستخدم
  Future<void> setUserIdentifier(String userId) async {
    print('Crashlytics: User ID set to $userId');
  }

  // تسجيل مفتاح/قيمة مخصص
  Future<void> setCustomKey(String key, dynamic value) async {
    print('Crashlytics Custom Key: $key = $value');
  }

  // تسجيل حالة الشبكة
  Future<void> logNetworkState(bool isConnected) async {
    await setCustomKey('network_connected', isConnected);
  }

  // تسجيل إجراء معين
  Future<void> logUserAction(String action, {Map<String, dynamic>? params}) async {
    print('Crashlytics User Action: $action, Params: $params');
  }

  // فرض سقوط تجريبي
  Future<void> crash() async {
    throw Exception('Test crash for Crashlytics');
  }
}
