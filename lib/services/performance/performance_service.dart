/// خدمة الأداء
class PerformanceService {
  static final PerformanceService _instance = PerformanceService._internal();
  factory PerformanceService() => _instance;
  PerformanceService._internal();

  final Map<String, DateTime> _startTimes = {};

  // بدء قياس الأداء
  void startTrace(String name) {
    _startTimes[name] = DateTime.now();
    print('Performance: Started trace - $name');
  }

  // إنهاء قياس الأداء
  Future<void> endTrace(String name) async {
    final startTime = _startTimes[name];
    if (startTime != null) {
      final duration = DateTime.now().difference(startTime);
      print('Performance: $name took ${duration.inMilliseconds}ms');
      _startTimes.remove(name);

      // إرسال للتتبع
      await _logTrace(name, duration);
    }
  }

  // تسجيل تتبع مخصص
  Future<void> _logTrace(String name, Duration duration) async {
    print('Performance Trace: $name - ${duration.inMilliseconds}ms');
  }

  // قياس دالة
  Future<T> measure<T>(String name, Future<T> Function() action) async {
    startTrace(name);
    try {
      final result = await action();
      await endTrace(name);
      return result;
    } catch (e) {
      await logError('Error in $name: $e');
      rethrow;
    }
  }

  // تسجيل خطأ
  Future<void> logError(String message) async {
    print('Performance Error: $message');
  }

  // الحصول على معلومات الجهاز
  Map<String, dynamic> getDeviceInfo() {
    return {
      'platform': 'android',
      'version': '1.0.0',
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
