/// خدمة النسخ الاحتياطي
class BackupService {
  static final BackupService _instance = BackupService._internal();
  factory BackupService() => _instance;
  BackupService._internal();

  // إنشاء نسخة احتياطية
  Future<BackupResult> createBackup({
    bool includeOrders = true,
    bool includeAddresses = true,
    bool includeWishlist = true,
    bool includeSettings = true,
  }) async {
    try {
      // محاكاة إنشاء النسخة الاحتياطية
      await Future.delayed(const Duration(seconds: 3));

      return BackupResult(
        success: true,
        backupId: 'BK-${DateTime.now().millisecondsSinceEpoch}',
        size: 1024 * 512, // 512 KB
        createdAt: DateTime.now(),
      );
    } catch (e) {
      return BackupResult(
        success: false,
        error: 'فشل إنشاء النسخة الاحتياطية: $e',
      );
    }
  }

  // استعادة من نسخة احتياطية
  Future<bool> restoreBackup(String backupId) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return true;
    } catch (e) {
      return false;
    }
  }

  // الحصول على قائمة النسخ الاحتياطية
  Future<List<BackupInfo>> getBackups() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      BackupInfo(
        id: 'BK-1',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        size: 1024 * 256,
      ),
      BackupInfo(
        id: 'BK-2',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        size: 1024 * 200,
      ),
    ];
  }

  // حذف النسخة الاحتياطية
  Future<bool> deleteBackup(String backupId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}

class BackupResult {
  final bool success;
  final String? backupId;
  final int? size;
  final DateTime? createdAt;
  final String? error;

  BackupResult({
    required this.success,
    this.backupId,
    this.size,
    this.createdAt,
    this.error,
  });
}

class BackupInfo {
  final String id;
  final DateTime createdAt;
  final int size;

  BackupInfo({
    required this.id,
    required this.createdAt,
    required this.size,
  });

  String get formattedSize {
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
